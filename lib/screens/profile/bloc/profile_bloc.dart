import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/screens/profile/models/chapter.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial());
  Character _character = character1;
  List<Chapter> _chaptersList = chaptersList;

  ///отслеживает события, метод map сокращает код и не теряет состояние.
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield* event.map(
      ///стрим для инициализации
      initial: _mapInitialProfileEvent,
    );
  }

  Stream<ProfileState> _mapInitialProfileEvent(
      _InitialProfileEvent event) async* {
    ///возвращаем состояние загрузки
    yield ProfileState.loading();

    try {
      ///получение данных
    } catch (ex) {
      ///вовращаем состояние с ошибкой
    }

    ///возвращаем состояние с данными
    yield ProfileState.data(
      chaptersList: _chaptersList,
      character: _character,
    );
  }
}
