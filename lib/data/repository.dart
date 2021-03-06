import 'package:rick_and_morty_rus_api/data/models/episode_model.dart';

import 'models/character.dart';

import 'models/episode.dart';
import 'models/location.dart';
import 'network/service_api.dart';

class Repository {
  final _serviceApi = ServiceApi();

  Future<List<Character>?> getCharactersList(
      {required int pageNumber, required int pageSize}) async {
    final response = await _serviceApi.getCharacters(pageNumber, pageSize);
    return response.data;
  }

  Future<Episode> getEpisodeById(String id) async {
    final response = await _serviceApi.getEpisodeById(id);
    return response.data;
  }

  Future<List<Episode>?> getEpisodesList(
      {required int pageNumber, required int pageSize}) async {
    final response = await _serviceApi.getEpisodesList(pageNumber, pageSize);
    return response.data;
  }

  Future<Location> getLocationById(String id) async {
    final response = await _serviceApi.getLocationById(id);
    return response.data;
  }

  Future<List<Location>?> getLocationsList(
      {required int pageNumber, required int pageSize}) async {
    final response = await _serviceApi.getLocationsList(pageNumber, pageSize);
    return response.data;
  }

  Future<Character> getCharacter(String id) async {
    final response = await _serviceApi.getCharacterById(id);
    return response.data;
  }
}
