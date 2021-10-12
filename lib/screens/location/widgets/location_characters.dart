import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/data/models/person.dart';

import '/components/character_list_tile.dart';
import '/resources/icons.dart';

import '/data/models/character.dart';
import '/theme/color_theme.dart';
import '/theme/text_theme.dart';

class LocationCharacters extends StatelessWidget {
  final List<Character> charactersOnLocation;

  LocationCharacters(this.charactersOnLocation);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CharacterListTile(
        character: charactersOnLocation[index],
        suffix: SvgPicture.asset(
          AppIcons.arrowForwardIos,
          height: 8.0,
          color: ColorTheme.white,
        ),
        onTap: () {},
      ),
      itemCount: charactersOnLocation.length,
      itemExtent: 98.0,
    );
  }
}
