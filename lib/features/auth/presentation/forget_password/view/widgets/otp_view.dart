import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/otp_text_field.dart';

class OtpView extends StatefulWidget {
  final int itemCount;
  final bool showError;
  final void Function(String)? onSubmit;
  final Widget Function()? separator;

  const OtpView({
    super.key,
    this.itemCount = 0,
    this.showError = false,
    this.onSubmit,
    this.separator,
  });

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  String text = '';

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.itemCount,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.itemCount, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int index = 0; index < widget.itemCount; index++) ...[
              OtpTextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                autoFocus: index == 0,
                onChange: (value) {
                  if (value.isNotEmpty && index < widget.itemCount - 1) {
                    _focusNodes[index + 1].requestFocus();
                  } else if (value.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                  }

                  combineFieldsInput();
                },
                onSubmit: (index == widget.itemCount - 1)
                    ? widget.onSubmit
                    : null,
              ),
              if (index < widget.itemCount - 1)
                widget.separator?.call() ?? SizedBox(width: 5),
            ],
          ],
        ),
        if (widget.showError)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.info_outline, color: AppColors.lightRed, size: 15),
              SizedBox(width: 5),
              Text(
                AppStrings.invalidOtpCode,
                style: TextStyle(fontSize: 13, color: AppColors.lightRed),
              ),
            ],
          ),
      ],
    );
  }

  void combineFieldsInput() {
    text = '';
    for (var controller in _controllers) {
      text += controller.text;
    }
  }

  String getCharAt(int index) {
    return (text.length > index) ? text[index] : '';
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose;
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose;
    }
    super.dispose();
  }
}
