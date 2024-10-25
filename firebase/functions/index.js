/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

const db = admin.firestore();

// Rotate questions for all rooms every 15 seconds
exports.rotateQuestionForAllRooms = functions.region('asia-southeast1').pubsub
    .schedule('every 1 minutes')
    .onRun(async (context) => {
        const rotationCount = 4; // Number of rotations per minute
        const rotationInterval = 14750; // 14.75 seconds in milliseconds, overhead for the function to run

        for (let i = 0; i < rotationCount; i++) {
            await rotateQuestionsAndCalculateScores();

            // If this is not the last iteration, wait for the next rotation
            if (i < rotationCount - 1) {
                await new Promise(resolve => setTimeout(resolve, rotationInterval));
            }
        }

        console.log("Completed all rotations for this minute.");
    });

// Constants for scoring
const MAX_SCORE = 100;
const MIN_SCORE = 20;
const TOTAL_TIME = 15;

const rotateQuestionsAndCalculateScores = async (context) => {
    const roomsRef = db.collection('rooms');
    const questionsRef = db.collection('questions');

    // Get all rooms
    const roomsSnapshot = await roomsRef.get();

    if (roomsSnapshot.empty) {
        console.error("No rooms found!");
        return;
    }

    // Get all questions
    const questionsSnapshot = await questionsRef.get();
    const questions = [];

    questionsSnapshot.forEach(doc => {
        questions.push({ id: doc.id, ...doc.data() });
    });

    if (questions.length === 0) {
        console.error("No questions found!");
        return;
    }

    // Iterate through each room and rotate the question
    const batch = db.batch();

    for (const roomDoc of roomsSnapshot.docs) {
        const roomData = roomDoc.data();
        const roomId = roomDoc.id;

        // Select a random question from the questions array
        const randomQuestion = questions[Math.floor(Math.random() * questions.length)];

        // Get participants in the room
        const participantsRef = roomDoc.ref.collection('participants');
        const participantsSnapshot = await participantsRef.get();

        participantsSnapshot.forEach(participantDoc => {
            const participantData = participantDoc.data();
            const userId = participantDoc.id;

            // Calculate score if the user answered the last question
            if (participantData.last_answer !== undefined && participantData.answer_time !== undefined) {
                // Check if the answer is correct
                if (participantData.last_answer === roomData.current_question.correct_option) {
                    // Calculate remaining time
                    const timeTaken = (Date.now() - participantData.answer_time.toMillis()) / 1000;
                    const timeRemaining = Math.max(0, TOTAL_TIME - timeTaken);

                    // Calculate score based on time remaining
                    let score = MIN_SCORE + ((MAX_SCORE - MIN_SCORE) * timeRemaining) / TOTAL_TIME;
                    score = Math.round(score);

                    // Update user's score
                    batch.update(participantDoc.ref, {
                        score: admin.firestore.FieldValue.increment(score)
                    });

                    console.log(`User ${userId} in room ${roomId} earned ${score} points!`);
                }

                // Remove answer_time and last_answer fields
                batch.update(participantDoc.ref, {
                    answer_time: admin.firestore.FieldValue.delete(),
                    last_answer: admin.firestore.FieldValue.delete()
                });
            }
        });

        // Update the room with the new current question
        batch.update(roomDoc.ref, {
            current_question: randomQuestion,
            start_time: admin.firestore.FieldValue.serverTimestamp()
        });

        console.log(`Room ${roomId} rotated to question: ${randomQuestion.question_text}`);
    }

    // Commit the batch update for all rooms
    await batch.commit();

    console.log("All rooms updated with new questions and scores calculated!");
};