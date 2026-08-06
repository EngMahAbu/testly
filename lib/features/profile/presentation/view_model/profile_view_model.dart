import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/features/profile/presentation/view_model/profile_event.dart';
import 'package:testly/features/profile/presentation/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel() : super(ProfileState());

  void doEvent(ProfileEvent event) {}
}
