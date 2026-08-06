class ProfileState {
  // BaseState<UserEntity>? signup;

  ProfileState(
    // {this.signup}
  );

  ProfileState copyWith(
    // {BaseState<UserEntity>? signup}
  ) {
    return ProfileState(
      // signup: signup ?? this.signup
    );
  }
}
