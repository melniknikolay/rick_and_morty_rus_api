import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_rus_api/data/models/season.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';

part 'episodes_list_event.dart';
part 'episodes_list_state.dart';
part 'episodes_list_bloc.freezed.dart';

class EpisodesListBloc extends Bloc<EpisodesListEvent, EpisodesListState> {
  EpisodesListBloc() : super(EpisodesListState.initial());
  List<Season> _seasons = seasons;

  @override
  Stream<EpisodesListState> mapEventToState(
    EpisodesListEvent event,
  ) async* {
    yield* event.map(
      /// Стрим для инициализации
      initial: _mapInitialEpisodesListEvent,
    );
  }

  Stream<EpisodesListState> _mapInitialEpisodesListEvent(
      _InitialEpisodesListEvent event) async* {
    yield EpisodesListState.loading();

    try {
      /// Получение данных
    } catch (ex) {
      /// Вовращаем состояние с ошибкой
    }

    /// Возвращаем состояние с данными
    yield EpisodesListState.data(seasons: _seasons);
  }
}
