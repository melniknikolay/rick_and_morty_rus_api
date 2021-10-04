import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/color_theme.dart';

class AppCircleButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  AppCircleButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorTheme.blue_600,
        shape: CircleBorder(),
      ),
      child: SvgPicture.asset(
        icon,
        width: 14.0,
        color: ColorTheme.white,
      ),
      onPressed: onPressed,
    );
  }
}
