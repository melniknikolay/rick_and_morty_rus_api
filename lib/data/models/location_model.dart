import 'dart:convert';

import 'package:rick_and_morty_rus_api/data/models/location.dart';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.succeeded,
    this.message,
    this.error,
    required this.data,
  });

  final bool? succeeded;
  final dynamic message;
  final dynamic error;
  final Location data;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        succeeded: json["succeeded"],
        message: json["message"],
        error: json["error"],
        data: Location.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
        "error": error,
        "data": data.toJson(),
      };
}
