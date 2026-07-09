import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_styles.dart';

class MainTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextEditingController? _controller;
  final String? Function(String?)? validator;

  const MainTextField({
    super.key,
    required this.label,
    required this.hint,
    this.labelStyle = AppStyles.textFieldLabel,
    this.hintStyle = AppStyles.textFieldHint,
    TextEditingController? controller,
    this.validator,
  }) : _controller = controller;

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
      ),
      controller: _controller,
      validator: validator,
    );
  }
}
