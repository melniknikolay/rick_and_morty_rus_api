import 'package:rick_and_morty_rus_api/data/models/episode.dart';

class Season {
  final String name;
  final List<Episode> episodes;

  Season(
    this.name,
    this.episodes,
  );
}
