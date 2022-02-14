import 'package:get_rest/core/model/surah.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ResponseSurah responseSurahFromJson(String str) =>
    ResponseSurah.fromJson(json.decode(str));

String responseSurahToJson(ResponseSurah data) => json.encode(data.toJson());

class ResponseSurah {
  ResponseSurah({
    required this.data,
  });

  List<Surah> data; 

  factory ResponseSurah.fromJson(Map<String, dynamic> json) => ResponseSurah(
        data: List<Surah>.from(json["data"].map((x) => Surah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
