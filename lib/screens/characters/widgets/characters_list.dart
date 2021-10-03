import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';

import 'character_tile.dart';

class CharactersList extends StatelessWidget {
  final List<Character> charactersList;

  CharactersList(this.charactersList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CharacterTile(charactersList[index]),
      itemCount: charactersList.length,
      itemExtent: 98.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
    );
  }
}
