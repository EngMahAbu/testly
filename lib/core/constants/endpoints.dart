abstract final class Endpoints {
  static const baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const signIn = 'auth/signin';

  static const signup = 'auth/signup';
  static const subjects = '/subjects';
  static const exams = '/exams?';
  static const questions = '/questions?';
  static const parameterSubject = 'subject';
  static const parameterExam = 'exam';
  static const forgetPassword = 'auth/forgotPassword';
  static const verifyResetCode = 'auth/verifyResetCode';
  static const resetPassword = 'auth/resetPassword';
  static const profileData = 'auth/profileData';
  static const editProfile = 'auth/editProfile';
  static const changePassword = 'auth/changePassword';
}
