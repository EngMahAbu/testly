import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String title;
  final List<Widget>? actions;
  final bool hideLeading;

  const MainAppBar({
    super.key,
    this.leadingIcon,
    required this.title,
    this.actions,
    this.hideLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !hideLeading,
      leading: (hideLeading)
          ? null
          : (leadingIcon != null)
          ? Padding(
              padding: EdgeInsetsDirectional.only(start: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(leadingIcon!, color: AppColors.black),
              ),
            )
          : Padding(
              padding: EdgeInsetsDirectional.only(start: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: AppColors.black),
              ),
            ),
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: (hideLeading) ? 16 : 0),
        // TODO: optimize this title (make it bold) in UI optimization
        child: Text(title),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
