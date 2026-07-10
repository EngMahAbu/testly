import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() => _RememberMeAndForgetPasswordState();
}
bool value = false;
class _RememberMeAndForgetPasswordState extends State<RememberMeAndForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                                          Checkbox(
                        value: value,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue ?? false;
                          });
                        },
                      ),
                      
                      Text("Remember me", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget password?",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              );
  }
}