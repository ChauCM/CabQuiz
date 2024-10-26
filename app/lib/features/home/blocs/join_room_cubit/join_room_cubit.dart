import 'package:bloc/bloc.dart';
import 'package:cabquiz/features/home/domain/dto/user/user_dto.dart';
import 'package:cabquiz/features/home/domain/repository/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'join_room_state.dart';
part 'join_room_cubit.freezed.dart';

class JoinRoomCubit extends Cubit<JoinRoomState> {
  JoinRoomCubit({required this.repository}) : super(const JoinRoomState());

  final HomeRepository repository;

  void setUsername(String? username) {
    emit(state.copyWith(username: username));
  }

  void setRoomId(String? roomId) {
    emit(state.copyWith(roomId: int.tryParse(roomId ?? '')));
  }

  Future<void> joinRoom() async {
    emit(state.copyWith(status: JoinRoomStatus.loading));

    if (state.username == null || state.roomId == null) {
      emitError('Username and room ID are required');
      return;
    }

    final result = await repository.joinRoom(
      user: UserDto(username: state.username!),
      roomId: state.roomId!,
    );

    result.fold(
      (l) => emitError(l.message),
      (r) => emit(state.copyWith(status: JoinRoomStatus.success)),
    );
  }

  void emitError(String message) {
    emit(state.copyWith(status: JoinRoomStatus.failure, errorMessage: message));
    // reset the state
    emit(state.copyWith(status: JoinRoomStatus.initial, errorMessage: null));
  }
}
