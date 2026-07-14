abstract final class AppStrings {
  // UI Strings
  static const signupScreenTitle = 'Sign Up';
  static const loginScreenTitle = 'Log In';
  static const usernameTextFieldLabel = 'User name';
  static const usernameTextFieldHint = 'Enter your user name';
  static const firstNameTextFieldLabel = 'First name';
  static const firstNameTextFieldHint = 'Enter first name';
  static const lastNameTextFieldLabel = 'Last name';
  static const lastNameTextFieldHint = 'Enter last name';
  static const emailTextFieldLabel = 'Email';
  static const emailTextFieldHint = 'Enter your email';
  static const passwordTextFieldLabel = 'Password';
  static const passwordTextFieldHint = 'Enter password';
  static const confirmPasswordTextFieldLabel = 'Confirm password';
  static const confirmPasswordTextFieldHint = 'Confirm password';
  static const phoneNumberTextFieldLabel = 'Phone number';
  static const phoneNumberTextFieldHint = 'Enter phone number';
  static const signupButton = 'Signup';
  static const alreadyHaveAccount = 'Already have an account?';
  static const dontHaveAccount = "Don't have an account?";
  static const loginButton = 'Login';

  // API Response Messages
  static const generalErrorMessage =
      'Something went wrong. Please try again later.';
  static const connectionErrorMessage =
      'Connection timeout. Please check your internet connection and try again.';
  static const noConnectionErrorMessage =
      'No internet connection. Please check your network and try again.';
  static const securityErrorMessage = 'Security error. Please try again later.';
  static const cancelErrorMessage = 'Request was cancelled.';

  // Status Code Messages
  static const code400Message =
      'Invalid information. Please check your details and try again.';
  static const code401Message =
      'Session expired or invalid credentials. Please log in again.';

  static const code403Message =
      'You don\'t have permission to perform this action.';
  static const code404Message =
      'Requested resource not found. Please try again later.';
  static const code409Message =
      'This account already exists. Try logging in instead.';
  static const code422Message = 'Please check your information and try again.';
  static const code429Message =
      'Too many attempts. Please wait a moment before trying again.';
  static const code500sMessage =
      'Server is temporarily unavailable. Please try again in a few moments.';

  // Form Validation Messages
  static const String generalValidationError = 'Invalid input';
  static const String emptyValidationError = 'This field is required';
  static const String usernameValidationError =
      'Username must be at least 3 characters long and can only contain letters, numbers, underscores, or dots.';
  static const String nameValidationError =
      'Name must be at least 3 characters long and can only contain letters and spaces.';
  static const String emailValidationError =
      'Please enter a valid email address (e.g., user@example.com).';
  static const String passwordLengthValidationError =
      'Password must be at least 8 characters long.';
  static const String passwordUppercaseValidationError =
      'Password must contain at least one uppercase letter.';
  static const String passwordLowercaseValidationError =
      'Password must contain at least one lowercase letter.';
  static const String passwordNumberValidationError =
      'Password must contain at least one number.';
  static const String passwordSpecialCharValidationError =
      'Password must contain at least one special character (#?!@\$%^&*-).';
  static const String phoneValidationError =
      'Please enter a valid Egyptian phone number starting with 010, 011, 012, or 015 followed by 8 digits.';
  static const String confirmPasswordError = 'Passwords do not match';

  // Exam Feature
  static const examScreenTitle = 'Survey';
  static const searchHint = 'Search';
  static const String browseBySubject = 'Browse by subject';
  static const String notFoundSubjects = 'There is no subjects found';
}
