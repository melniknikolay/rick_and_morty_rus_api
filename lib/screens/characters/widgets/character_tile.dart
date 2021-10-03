import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/models/character.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  CharacterTile(this.character);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 18),
          child: CircleAvatar(
            radius: 37,
            child: Image.asset(character.avatar),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.status,
                style: AppTextTheme.subtitle2.copyWith(
                    letterSpacing: 1.5,
                    color: character.status == 'ЖИВОЙ'
                        ? ColorTheme.green_200
                        : ColorTheme.red_100),
              ),
              Text(
                character.name,
                style: AppTextTheme.subtitle1.copyWith(letterSpacing: 0.5),
              ),
              Text(
                '${character.race}, ${character.gender}',
                style: AppTextTheme.caption.copyWith(
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
