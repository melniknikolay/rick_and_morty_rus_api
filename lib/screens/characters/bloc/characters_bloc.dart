import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/data/models/character.dart';
import '/resources/variables.dart';

part '../bloc/characters_event.dart';
part '../bloc/characters_state.dart';
part 'characters_bloc.freezed.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersState.initial());
  bool isGrid = false;
  List<Character> _charactersList = charactersList;

  /// Отслеживает события. Метод map позволяет нам сократить код и не дает потерять состояние.
  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    yield* event.map(
      /// Стрим для инициализации
      initial: _mapInitialCharactersEvent,

      /// Стрим для выбора темы
      selectedView: _mapSelectedViewCharactersEvent,
    );
  }

  Stream<CharactersState> _mapInitialCharactersEvent(
      _InitialCharactersEvent event) async* {
    /// Возвращаем состояние загрузки
    yield CharactersState.loading();

    try {
      /// Получение данных
    } catch (ex) {
      /// Возвращаем состояние с ошибкой
    }

    /// Возвращаем состояние с данными
    yield CharactersState.data(
      charactersList: _charactersList,
      isGrid: isGrid,
    );
  }

  Stream<CharactersState> _mapSelectedViewCharactersEvent(
      _SelectedViewCharactersEvent event) async* {
    yield CharactersState.loading();
    isGrid = event.isGrid; // check !event
    yield CharactersState.data(
      charactersList: _charactersList,
      isGrid: isGrid,
    );
  }
}