import 'package:rick_and_morty_rus_api/data/models/episode.dart';

import '/screens/profile/models/chapter.dart';

class Season {
  final String name;
  final List<Episode> chapters;

  Season(
    this.name,
    this.chapters,
  );
}
