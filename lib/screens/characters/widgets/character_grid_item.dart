import 'package:flutter/material.dart';

import 'package:rick_and_morty_rus_api/data/models/character.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

class CharacterGridItem extends StatelessWidget {
  final Character character;
  CharacterGridItem(this.character);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(character.avatar),
          backgroundColor: ColorTheme.blueGrey_600,
        ),
        const SizedBox(height: 18.0),
        Text(
          character.status,
          style: AppTextTheme.subtitle2.copyWith(
              letterSpacing: 1.5,
              height: 1.6,
              color: character.status == 'ЖИВОЙ'
                  ? ColorTheme.green_200
                  : ColorTheme.red_100),
        ),
        Text(
          character.name,
          style: AppTextTheme.bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.42,
          ),
        ),
        Text(
          '${character.race}, ${character.gender}',
          style: AppTextTheme.caption.copyWith(
            height: 1.33,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
