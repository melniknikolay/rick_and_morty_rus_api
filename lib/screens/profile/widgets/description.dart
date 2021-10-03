import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/models/character.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

import 'column_text.dart';
import 'location_tile.dart';

class Description extends StatelessWidget {
  const Description({
    required Key? key,
    required this.avatarSize,
    required this.character,
  });

  final double avatarSize;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: avatarSize + 24.0),
            Text(
              character.name,
              style: AppTextTheme.headline4.copyWith(
                height: 1.17,
                letterSpacing: 0.25,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              character.status,
              style: AppTextTheme.subtitle2.copyWith(
                  letterSpacing: 1.5,
                  color: character.status == 'ЖИВОЙ'
                      ? ColorTheme.green_200
                      : ColorTheme.red_100),
            ),
            SizedBox(height: 36.0),
            Text(
              character.biography,
              style: AppTextTheme.bodyText2.copyWith(
                height: 1.5,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                ColumnText('Пол', character.gender),
                Spacer(),
                ColumnText('Раса', character.race),
                Spacer(),
              ],
            ),
            SizedBox(height: 20.0),
            LocationTile('Место рождения', character.birthplace),
            SizedBox(height: 24.0),
            LocationTile('Местоположение', character.location),
          ],
        ),
      ),
    );
  }
}
