import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/models/character.dart';
import 'package:rick_and_morty_rus_api/components/search_text_field.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

import 'widgets/characters_count.dart';
import 'widgets/characters_grid.dart';
import 'widgets/characters_list.dart';

final List<Character> _charactersList = charactersList;

class CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.blue_900,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SearchTextField(title: 'Найти персонажа'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CharactersCount(
            charactersCount: charactersList.length,
            onSelected: (value) {
              setState(() {
                isGridView = value;
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: isGridView
            ? CharactersGrid(_charactersList)
            : CharactersList(_charactersList),
      ),
    );
  }
}
