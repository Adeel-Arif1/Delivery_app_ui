import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final VoidCallback? onBackPress;

  const CustomAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.onBackPress, //required IconData icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left_outlined, color: AppColors.primaryTextColor),
        onPressed: onBackPress ?? () => Navigator.of(context).pop(),
      ),
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
