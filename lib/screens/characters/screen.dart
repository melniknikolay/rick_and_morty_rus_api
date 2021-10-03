import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_rus_api/components/app_bottom_navigation_bar.dart';

import 'package:rick_and_morty_rus_api/components/search_text_field.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/screens/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

import 'widgets/characters_count.dart';
import 'widgets/characters_grid.dart';
import 'widgets/characters_list.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Делаем доступным блок в дереве виджетов
    return BlocProvider<CharactersBloc>(
      create: (BuildContext context) =>
          CharactersBloc()..add(CharactersEvent.initial()),

      /// Обрабатываем состояние
      child: BlocConsumer<CharactersBloc, CharactersState>(
        ///Используется для отображения ошибок,навигации и др.
        listener: (context, state) {},

        /// Обрабатывает состояния
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => CircularProgressIndicator(),
            data: (_data) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorTheme.blue_900,
                automaticallyImplyLeading: false,
                title: SearchTextField(title: 'Найти персонажа'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: CharactersCount(
                    charactersCount: _data.charactersList.length,
                    onSelected: (value) {
                      /// Для создания события используется контекст с обращением к блоку в контексте
                      context.read<CharactersBloc>()
                        ..add(
                          CharactersEvent.selectedView(isGrid: value),
                        );
                    },
                  ),
                ),
              ),
              body: _data.isGrid
                  ? CharactersGrid(charactersList)
                  : CharactersList(charactersList),
              bottomNavigationBar: AppBottomNavigationBar(
                currentIndex: 0,
              ),
            ),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
