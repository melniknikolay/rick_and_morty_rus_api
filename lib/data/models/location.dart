import 'package:rick_and_morty_rus_api/data/models/character.dart';

class Location {
  final String? id;
  final String? name;
  final String? type;
  final String? measurements;
  final String? about;
  final String? imageName;
  final List<Character>? characters;
  final List<Character>? placeOfBirthCharacters;

  Location({
    this.id,
    this.name,
    this.type,
    this.measurements,
    this.about,
    this.imageName,
    this.characters,
    this.placeOfBirthCharacters,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        measurements: json["measurements"],
        about: json["about"],
        imageName: json["imageName"],
        characters: List<Character>.from(
            json["characters"]?.map((x) => Character.fromJson(x)) ?? []),
        placeOfBirthCharacters: List<Character>.from(
            json["placeOfBirthCharacters"]?.map((x) => Character.fromJson(x)) ??
                []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "measurements": measurements,
        "about": about,
        "imageName": imageName,
        "characters":
            List<dynamic>.from(characters?.map((x) => x.toJson()) ?? []),
        "placeOfBirthCharacters": List<dynamic>.from(
            placeOfBirthCharacters?.map((x) => x.toJson()) ?? []),
      };
}
