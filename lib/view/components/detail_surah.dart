import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({
    Key? key,
  }) : super(key: key);

  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  bool playing = false;
  IconData playbtn = Icons.play_arrow;

  late AudioPlayer player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLenght = new Duration();

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
        activeColor: Colors.lightBlue[500],
        inactiveColor: Colors.lightBlue[200],
        value: position.inSeconds.toDouble(),
        max: musicLenght.inSeconds.toDouble(),
        onChanged: (double value) {},
        //  onChanged:(),
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen[500]!,
              Colors.green[300]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Beautiful AL-Quran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Dengarkan Suara Indah AL-Quran',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Container(
                    width: 280.0,
                    height: 280.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/alqur_an.jpeg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const Center(
                  child: Text(
                    // surah.asma,
                    'judul surah',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              slider(),
                              Text(
                                '${musicLenght.inMinutes}:${musicLenght.inSeconds.remainder(60)}',
                                style: const TextStyle(fontSize: 18.0),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.skip_previous,
                              ),
                            ),
                            IconButton(
                              iconSize: 62.0,
                              onPressed: () {
                                if (!playing) {
                                  // cache.play('judul surah.mp3');
                                  setState(() {
                                    playbtn = Icons.pause;
                                    playing = true;
                                  });
                                } else {
                                  player.pause();
                                  setState(() {
                                    playbtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              icon: Icon(playbtn),
                            ),

                            IconButton(
                              iconSize: 45.0,
                              onPressed: () {},
                              icon: const Icon(Icons.skip_next),
                            )
                            // IconButton(onPressed: onPressed, icon: icon)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
