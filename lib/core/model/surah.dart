import 'package:meta/meta.dart';
import 'dart:convert';

class Surah {
  Surah({
    required this.arti,
    required this.asma,
    required this.ayat,
    required this.nama,
    required this.audio,
  });

  String arti;
  String asma;
  int ayat;
  String nama;
  String audio;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        arti: json["arti"] == null ? null : json["arti"],
        asma: json["asma"] == null ? null : json["asma"],
        ayat: json["ayat"] == null ? null : json["ayat"],
        nama: json["nama"] == null ? null : json["nama"],
        audio: json["audio"] == null ? null : json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti == null ? null : arti,
        "asma": asma == null ? null : asma,
        "ayat": ayat == null ? null : ayat,
        "nama": nama == null ? null : nama,
        "audio": audio == null ? null : audio,
      };
}
