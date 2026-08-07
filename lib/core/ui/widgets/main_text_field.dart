import 'package:flutter/material.dart';
import 'package:testly/config/form_validator/form_validator.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';

class MainTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextEditingController? _controller;
  final String? Function(String?)? validator;
  final String? validationPattern;
  final String? validationErrorMessage;
  final void Function(String)? onChange;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  MainTextField({
    super.key,
    required this.label,
    required this.hint,
    this.labelStyle = AppStyles.textFieldLabel,
    this.hintStyle = AppStyles.textFieldHint,
    TextEditingController? controller,
    this.validator,
    this.validationPattern,
    this.validationErrorMessage,
    this.onChange,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  }) : _controller = controller {
    assert(
      !(validationPattern != null &&
          validationErrorMessage != null &&
          validator != null),
      "You can either provide a custom validator or provide the validation pattern and error.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: labelStyle,
        labelText: label,
        hintText: hint,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
      ),
      controller: _controller,
      validator: validator ?? defaultValidator,
      onChanged: onChange,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  String? defaultValidator(String? input) {
    if (input == null) {
      return AppStrings.generalValidationError;
    }

    if (input.isEmpty) {
      return AppStrings.emptyValidationError;
    }

    if (!FormValidator.validate(validationPattern!, input)) {
      return validationErrorMessage;
    }

    return null;
  }
}
