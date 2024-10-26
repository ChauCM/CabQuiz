import 'package:freezed_annotation/freezed_annotation.dart';

part 'leader_board_dpo.freezed.dart';

@freezed
class LeaderBoardDpo with _$LeaderBoardDpo {
  factory LeaderBoardDpo({
    required String username,
    @Default(0) int score,
    required String avatarCode,
  }) = _LeaderBoardDpo;

  const LeaderBoardDpo._();
}
