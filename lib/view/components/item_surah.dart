import 'package:flutter/material.dart';
import 'package:get_rest/core/model/surah.dart';

class ItemSurah extends StatelessWidget {
  const ItemSurah({
    Key? key,
    required this.surah,
    required this.onPress,
  }) : super(key: key);

  final Surah surah;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Card(
          color: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        surah.arti,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        surah.asma,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        surah.nama,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
