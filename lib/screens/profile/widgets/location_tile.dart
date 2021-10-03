import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

import 'arrow_button.dart';

class LocationTile extends StatelessWidget {
  const LocationTile(
    this.title,
    this.location,
  );

  final String title;
  final String location;

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
        ArrowButton(onPressed: () {}),
      ],
    );
  }
}
