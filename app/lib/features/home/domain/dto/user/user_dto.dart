import 'package:cabquiz/features/home/models/user/user_dpo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    required String username,
    String? avatarCode,
  }) = _UserDto;

  factory UserDto.fromDpo(UserDpo dpo) => UserDto(
        username: dpo.username!,
        avatarCode: dpo.avatarCode,
      );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
