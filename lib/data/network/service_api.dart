import 'package:dio/dio.dart';
import 'package:rick_and_morty_rus_api/data/models/characters_list_model.dart';
import 'package:rick_and_morty_rus_api/data/models/characters_model.dart';
import 'package:rick_and_morty_rus_api/data/models/episode_list_model.dart';
import 'package:rick_and_morty_rus_api/data/models/episode_model.dart';
import 'package:rick_and_morty_rus_api/data/models/location_list_model.dart';
import 'package:rick_and_morty_rus_api/data/models/location_model.dart';
import 'dio_settings.dart';

class ServiceApi {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// TODO: мап для запроса?!
  // late Map<String, dynamic> _request;

  /// singleton
  static ServiceApi _instance = new ServiceApi.internal();
  factory ServiceApi() => _instance;

  ServiceApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  Future<CharactersListModel> getCharacters(
      int pageNumber, int pageSize) async {
    print("## Пошел запрос на персонажей");
    Response<String> response = await _dio.get(
      "/Characters/GetAll",
      queryParameters: {"PageNumber": pageNumber, "PageSize": pageSize},
    );
    return charactersListModelFromJson(response.toString());
  }

  Future<EpisodeModel> getEpisodeById(String id) async {
    print("## Пошел запрос на выбранный эпизод");
    Response<String> response = await _dio.get(
      "/Episodes/GetById",
      queryParameters: {"Id": id},
    );
    return episodeModelFromJson(response.toString());
  }

  Future<EpisodesListModel> getEpisodesList(
      int pageNumber, int pageSize) async {
    print("## Пошел запрос на список всех эпизодов");
    Response<String> response = await _dio.get(
      "/Episodes/GetAll",
      queryParameters: {"PageNumber": pageNumber, "PageSize": pageSize},
    );
    return episodesListModelFromJson(response.toString());
  }

  Future<LocationModel> getLocationById(String id) async {
    print("## Пошел запрос на выбранную локацию");
    Response<String> response = await _dio.get(
      "/Locations/GetById",
      queryParameters: {"Id": id},
    );
    return locationModelFromJson(response.toString());
  }

  Future<LocationsListModel> getLocationsList(
      int pageNumber, int pageSize) async {
    print("## Пошел запрос на список всех локаций");
    Response<String> response = await _dio.get(
      "/Locations/GetAll",
      queryParameters: {"PageNumber": pageNumber, "PageSize": pageSize},
    );
    return locationsListModelFromJson(response.toString());
  }

  Future<CharacterModel> getCharacterById(String id) async {
    print("## Пошел запрос на выбранного персонажа");
    Response<String> response = await _dio.get(
      "/Characters/GetById",
      queryParameters: {'Id': id},
    );
    return characterModelFromJson(response.toString());
  }
}
