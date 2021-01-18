import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlaySound(color: Colors.blueGrey[50], play: 1, text: 1),
                  PlaySound(color: Colors.green[100], play: 2, text: 2),
                  PlaySound(color: Colors.deepOrange[50], play: 3, text: 3),
                  PlaySound(color: Colors.blue[200], play: 4, text: 4),
                  PlaySound(color: Colors.green[50], play: 5, text: 5),
                  PlaySound(color: Colors.tealAccent[100], play: 6, text: 6),
                  PlaySound(color: Colors.red[100], play: 7, text: 7),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaySound extends StatelessWidget {
  PlaySound({@required this.color, @required this.play, this.text});
  final int text;
  final Color color;
  final int play;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          final AudioCache plays = AudioCache();
          plays.play('note${play.toString()}.wav');
        },
        child: Text('Play ${text.toString()}'),
      ),
    );
  }
}
