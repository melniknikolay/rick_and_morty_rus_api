import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/status_text.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';

import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

import 'column_text.dart';
import 'location_tile.dart';

class Description extends StatelessWidget {
  final double avatarSize;
  final Character character;

  const Description({
    required this.avatarSize,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: avatarSize + 24.0),
            Text(
              character.fullName ?? "N/A",
              style: AppTextTheme.headline4.copyWith(
                height: 1.17,
                letterSpacing: 0.25,
              ),
            ),
            const SizedBox(height: 4.0),
            StatusText(statusIndex: character.status ?? 2),
            const SizedBox(height: 36.0),
            Text(
              character.about ?? "Not available.",
              style: AppTextTheme.bodyText2.copyWith(
                height: 1.5,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                ColumnText('Пол', getGenderText(character.gender ?? 2)),
                Spacer(),
                ColumnText('Раса', character.race ?? "Неизвестно"),
                Spacer(),
              ],
            ),
            const SizedBox(height: 20.0),
            LocationTile(
                'Место рождения', character.placeOfBirth?.name ?? "Неизвестно"),
            const SizedBox(height: 24.0),
            LocationTile('Местоположение', "Неизвестно"),
          ],
        ),
      ),
    );
  }
}

String getGenderText(int genderIndex) {
  switch (genderIndex) {
    case 0:
      return "Мужской";
    case 1:
      return "Женский";
    default:
      return "Неизвестно";
  }
}
