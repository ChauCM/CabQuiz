import 'package:cabquiz/features/leaderboard/models/leader_board_dpo/leader_board_dpo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_avatar/random_avatar.dart';

part 'leader_board_dto.freezed.dart';
part 'leader_board_dto.g.dart';

@freezed
class LeaderBoardDto with _$LeaderBoardDto {
  factory LeaderBoardDto({
    required String username,
    @Default(0) int score,
  }) = _LeaderBoardDto;

  const LeaderBoardDto._();

  LeaderBoardDpo toDpo() => LeaderBoardDpo(
        username: username,
        score: score,
        avatarCode: RandomAvatarString(username),
      );

  factory LeaderBoardDto.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return LeaderBoardDto(
      username: data?['username'] ?? snapshot.id,
      score: data?['score'] ?? 0,
    );
  }

  factory LeaderBoardDto.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardDtoFromJson(json);
}
