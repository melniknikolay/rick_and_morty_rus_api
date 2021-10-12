import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/components/race_gender_text.dart';
import 'package:rick_and_morty_rus_api/components/status_text.dart';

import '../data/models/person.dart';
import '../data/models/character.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  final Widget? suffix;

  CharacterListTile({
    required this.character,
    required this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Container(
            alignment: Alignment.center,
            width: 74.0,
            height: 74.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(character.imageName ?? "None"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(40.0),
              color: ColorTheme.blue_600,
            ),
          ),
          const SizedBox(width: 18.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusText(statusIndex: character.status ?? 2),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.0),
                child: Text(
                  character.fullName ?? "None",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: AppTextTheme.subtitle1.copyWith(
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              RaceGenderText(character: character),
            ],
          ),
          Spacer(),
          ...[suffix ?? Container()],
          const SizedBox(width: 26.0),
        ],
      ),
      onTap: onTap,
    );
  }
}
