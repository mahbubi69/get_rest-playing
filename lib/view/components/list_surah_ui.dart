import 'package:flutter/material.dart';
import 'package:get_rest/core/model/surah.dart';
import 'package:get_rest/core/repository/repository_surah.dart';
import 'package:get_rest/view/components/detail_surah.dart';
import 'package:get_rest/view/components/item_surah.dart';

class ListSurahUi extends StatefulWidget {
  const ListSurahUi({Key? key}) : super(key: key);

  @override
  _ItemListSurahUiState createState() => _ItemListSurahUiState();
}

class _ItemListSurahUiState extends State<ListSurahUi> {
  var dataSurah;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataSurah = RepositorySurah().getDataSurah();
    // surah = ResponseSurah(data: index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Surah>>(
          future: dataSurah,
          builder: (context, AsyncSnapshot snapshot) {
            // ignore: unnecessary_null_comparison
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<Surah> surahList = snapshot.data;
              print(surahList.length);
              return ListView.builder(
                  itemCount: surahList.length,
                  itemBuilder: (context, index) {
                    Surah surah = surahList[index];
                    return ItemSurah(
                      surah: surah,
                      onPress: () => (Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailSurah(),
                        ),
                      )),
                    );
                  });
            }
          }),
    );
  }
}
