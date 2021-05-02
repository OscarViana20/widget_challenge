import 'package:flutter/material.dart';
import 'package:widget_challenge/src/models/song_model.dart';

class WidgetPlayed extends StatelessWidget {


  WidgetPlayed({
    this.songModel,
    Key key
  }) : super(key: key);

  final SongModel songModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image.asset(songModel.imagePath,
              fit: BoxFit.fill,
              width: size.width,
              height: size.width / 1.2,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 20,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(songModel.imagePerson),
                  ),
                  SizedBox(height: 5.0),
                  Text(songModel.artistName, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 17)),
                  SizedBox(height: 5.0),
                  Text(songModel.titleSong, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              )
            )            
          ],
        ),
      ),
    );
  }
}