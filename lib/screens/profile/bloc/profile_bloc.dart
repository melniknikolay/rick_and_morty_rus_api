import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';
import 'package:rick_and_morty_rus_api/data/models/episode.dart';
import 'package:rick_and_morty_rus_api/data/repository.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial());

  final _repository = Repository();
  late Character _character;

  /// Отслеживает события. Метод map позволяет нам сократить код и не дает потерять состояние.
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield* event.map(
      /// Стрим для инициализации
      initial: _mapInitialProfileEvent,
    );
  }

  Stream<ProfileState> _mapInitialProfileEvent(
      _InitialProfileEvent event) async* {
    /// Возвращаем состояние загрузки
    yield ProfileState.loading();

    try {
      /// Получение данных
      print("## Начинаем загрузку профиля персонажа");
      _character = await _repository
          .getCharacter("367209e4-2cbe-4f70-a82f-9961d29d0962");
    } catch (ex) {
      /// Вовращаем состояние с ошибкой
      print("## Получи ошибку в блоке профиля персонажа $ex");
    }

    /// Возвращаем состояние с данными
    yield ProfileState.data(
      character: _character,
    );
  }
}
