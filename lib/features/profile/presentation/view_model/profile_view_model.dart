import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';
import 'package:testly/features/profile/domain/use_cases/change_password_use_case.dart';
import 'package:testly/features/profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:testly/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:testly/features/profile/presentation/view_model/profile_event.dart';
import 'package:testly/features/profile/presentation/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  ProfileViewModel(
    this._getProfileUseCase,
    this._editProfileUseCase,
    this._changePasswordUseCase,
  ) : super(ProfileState.initial());

  void doEvent(ProfileEvent event) {
    switch (event) {
      case GetProfileDataEvent():
        _getProfileData();
      case EditProfileEvent():
        _editProfile(event.editProfileRequest);
      case ChangePasswordEvent():
        _changePassword(
          ChangePasswordRequest(
            oldPassword: event.oldPassword,
            password: event.password,
            rePassword: event.rePassword,
          ),
        );
    }
  }

  Future<void> _getProfileData() async {
    emit(
      state.copyWith(profileData: state.profileData.copyWith(isLoading: true)),
    );
    final response = await _getProfileUseCase.call();
    switch (response) {
      case SuccessResponse():
        emit(
          state.copyWith(
            profileData: state.profileData.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: '',
            ),
          ),
        );
      case ErrorResponse():
        emit(
          state.copyWith(
            profileData: state.profileData.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _editProfile(EditProfileRequest editProfileRequest) async {
    emit(
      state.copyWith(
        updateProfile: state.updateProfile.copyWith(isLoading: true),
        currentProfileInfo: editProfileRequest,
      ),
    );
    final response = await _editProfileUseCase.call(editProfileRequest);
    switch (response) {
      case SuccessResponse():
        emit(
          state.copyWith(
            updateProfile: state.updateProfile.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: '',
            ),
            profileData: state.profileData.copyWith(data: response.data),
            currentProfileInfo: null,
          ),
        );
      case ErrorResponse():
        emit(
          state.copyWith(
            updateProfile: state.updateProfile.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    emit(
      state.copyWith(
        changePassword: state.changePassword.copyWith(isLoading: true),
      ),
    );
    final response = await _changePasswordUseCase.call(changePasswordRequest);
    switch (response) {
      case SuccessResponse():
        emit(
          state.copyWith(
            changePassword: state.changePassword.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: '',
            ),
          ),
        );
      case ErrorResponse():
        emit(
          state.copyWith(
            changePassword: state.changePassword.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }
}
