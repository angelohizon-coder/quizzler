import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/welcome-image.png",
            height: 200,
            width: 200,
          ),
          Center(
            child: Text(
              "Game of Guess",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 50),
          FlatButton.icon(
            onPressed: () {
              audioCache.play("sounds/start.ogg");
              Navigator.pushNamed(context, '/quizzler');
            },
            icon: Icon(
              Icons.play_arrow_outlined,
              size: 36,
            ),
            label: Text(
              "Play",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
