import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/data/models/person.dart';
import '/components/character_list_tile.dart';
import '/data/models/character.dart';
import '/resources/icons.dart';
import '/resources/variables.dart';
import '/theme/color_theme.dart';

class EpisodeCharacters extends StatelessWidget {
  final List<Character> characters;

  EpisodeCharacters(this.characters);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CharacterListTile(
        character: characters[index],
        suffix: SvgPicture.asset(
          AppIcons.arrowForwardIos,
          height: 8.0,
          color: ColorTheme.white,
        ),
        onTap: () {},
      ),
      itemCount: characters.length,
      itemExtent: 98.0,
    );
  }
}
