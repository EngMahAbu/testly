import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.arrow_back_ios,),
                  ),
                  SizedBox(width: 2),
                  Text(
                  title,
                    style: TextStyle(  fontSize: 24),
                  ),
                ],
              );
  }
}