import 'package:get_rest/core/model/surah.dart';
import 'package:get_rest/core/response/reponse_surah.dart';
import 'package:get_rest/core/service/network.dart';

class RepositorySurah extends Network {
  RepositorySurah();

  RepositorySurah._privateConstructor();

  static final RepositorySurah _instance =
      RepositorySurah._privateConstructor();

  static RepositorySurah get instance => _instance;

  Future<List<Surah>> getDataSurah() async {
    var map = await getMethod();
    return ResponseSurah.fromJson(map).data;
  }
}
