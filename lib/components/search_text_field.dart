import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../resources/icons.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';

class SearchTextField extends StatelessWidget {
  final String title;
  final Widget? suffixIcon;

  SearchTextField({
    required this.title,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      focusNode: FocusNode(),
      style: AppTextTheme.subtitle1.copyWith(letterSpacing: 0.5),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        filled: true,
        fillColor: ColorTheme.blue_600,
        hintText: title,
        hintStyle: AppTextTheme.body1.copyWith(letterSpacing: 0.44),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 12.0, 10.0, 12.0),
          child: SvgPicture.asset(
            AppIcons.search,
            color: ColorTheme.blueGrey_600,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      onSubmitted: (submit) {},
    );
  }
}
