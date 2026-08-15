import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/profile/domain/repositories/profile_repository.dart';

@singleton
class GetProfileUseCase {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  Future<BaseResponse<UserEntity>> call() async {
    return await _profileRepository.getProfileData();
  }
}
