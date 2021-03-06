import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/resources/icons.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

class LocationTile extends StatelessWidget {
  final String title;
  final String location;
  const LocationTile(
    this.title,
    this.location,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextTheme.caption.copyWith(
                height: 1.3,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              location,
              style: AppTextTheme.bodyText1.copyWith(
                letterSpacing: 0.25,
                height: 1.42,
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset(
          AppIcons.arrowForwardIos,
          height: 8.0,
          color: ColorTheme.white,
        ),
      ],
    );
  }
}
