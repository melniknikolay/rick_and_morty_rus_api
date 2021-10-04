import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/resources/icons.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  ArrowButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        AppIcons.arrowForwardIos,
        height: 8,
      ),
      color: ColorTheme.white,
      onPressed: onPressed,
    );
  }
}
