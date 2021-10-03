import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';

import 'character_grid_item.dart';

class CharactersGrid extends StatelessWidget {
  final List<Character> charactersList;
  CharactersGrid(this.charactersList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: GridView.builder(
        itemCount: charactersList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 0),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) =>
            CharacterGridItem(charactersList[index]),
      ),
    );
  }
}