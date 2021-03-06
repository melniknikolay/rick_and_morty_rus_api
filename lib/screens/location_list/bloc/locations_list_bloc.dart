import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_rus_api/data/models/location.dart';
import 'package:rick_and_morty_rus_api/data/repository.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';

part 'locations_list_event.dart';
part 'locations_list_state.dart';
part 'locations_list_bloc.freezed.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc() : super(LocationsListState.initial());

  final _repository = Repository();
  late List<Location> _locationsList;

  @override
  Stream<LocationsListState> mapEventToState(
    LocationsListEvent event,
  ) async* {
    yield* event.map(
      /// Стрим для инициализации
      initial: _mapInitialLocationsListEvent,
    );
  }

  Stream<LocationsListState> _mapInitialLocationsListEvent(
      _InitialLocationsListEvent event) async* {
    yield LocationsListState.loading();

    try {
      /// Получение данных
      print("## Начинаем загрузку всех локаций");
      _locationsList =
          await _repository.getLocationsList(pageNumber: 1, pageSize: 10) ?? [];
    } catch (ex) {
      /// Вовращаем состояние с ошибкой
      print("## Получи ошибку в блоке всех локаций $ex");
    }

    /// Возвращаем состояние с данными
    yield LocationsListState.data(locationsList: _locationsList);
  }
}
