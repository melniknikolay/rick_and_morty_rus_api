import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_rus_api/data/models/character.dart';

part 'global_event.dart';
part 'global_state.dart';
part 'global_bloc.freezed.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState.initial());

  /// TODO: final _repository = Repository();
  int _activeTab = 0;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    yield* event.map(
      /// Стрим для инициализации
      initial: _mapInitialGlobalEvent,

      /// Стрим для выбора таба
      selectedTab: _mapSelectedTabGlobalEvent,
    );
  }

  Stream<GlobalState> _mapInitialGlobalEvent(_InitialGlobalEvent event) async* {
    /// Возвращаем состояние загрузки
    yield GlobalState.loading();

    try {
      /// Получение данных

    } catch (ex) {
      /// Возвращаем состояние с ошибкой
    }

    /// Возвращаем состояние с данными
    yield GlobalState.data(
      activeTab: _activeTab,
    );
  }

  Stream<GlobalState> _mapSelectedTabGlobalEvent(
      _SelectedTabGlobalEvent event) async* {
    yield GlobalState.loading();
    _activeTab = event.index;
    yield GlobalState.data(
      activeTab: _activeTab,
    );
  }
}
