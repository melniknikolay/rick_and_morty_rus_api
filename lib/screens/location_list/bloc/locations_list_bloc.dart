import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_rus_api/data/models/location.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';

part 'locations_list_event.dart';
part 'locations_list_state.dart';
part 'locations_list_bloc.freezed.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc() : super(LocationsListState.initial());
  List<Location> _locationsList = locationsList;

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
    } catch (ex) {
      /// Вовращаем состояние с ошибкой
    }

    /// Возвращаем состояние с данными
    yield LocationsListState.data(locationsList: _locationsList);
  }
}
