import 'package:flutter/material.dart';

class OtpTextField extends StatefulWidget {
  final TextEditingController _controller;
  final FocusNode _focusNode;
  final bool _autoFocus;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  const OtpTextField({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    bool autoFocus = false,
    this.onChange,
    this.onSubmit,
  }) : _controller = controller,
       _focusNode = focusNode,
       _autoFocus = autoFocus;

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 60,
          maxHeight: 68,
          minWidth: 50,
          maxWidth: 75,
        ),
        child: TextField(
          autofocus: widget._autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: widget._controller,
          focusNode: widget._focusNode,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          onChanged: widget.onChange,
          onSubmitted: widget.onSubmit,
        ),
      ),
    );
  }
}
