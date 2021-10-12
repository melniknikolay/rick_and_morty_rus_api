import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/data/models/person.dart';
import '/components/character_list_tile.dart';
import '/data/models/character.dart';

class CharactersList extends StatelessWidget {
  final List<Character> charactersList;

  CharactersList(this.charactersList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CharacterListTile(
        character: charactersList[index],
        onTap: () {},
      ),
      itemCount: charactersList.length,
      itemExtent: 98.0,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
    );
  }
}
