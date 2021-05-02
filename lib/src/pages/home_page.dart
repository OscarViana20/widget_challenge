import 'package:flutter/material.dart';
import 'package:widget_challenge/src/models/song_model.dart';
import 'package:widget_challenge/src/widgets/widget_expanded.dart';
import 'package:widget_challenge/src/widgets/widget_played.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildList(context),
          WidgetExpanded()
        ],
      )
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: playedList.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _horizontaList(context),
              SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text('Recently played', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              )
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: WidgetPlayed(
            songModel: playedList[index - 1]
          ),
        );
      }
    );
  }

  Widget _horizontaList(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 3.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: playedList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(playedList[index].imagePerson,
                      fit: BoxFit.cover,                      
                      height: size.height / 5,
                      width: 130,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(playedList[index].artistName, style: TextStyle(color: Colors.grey, fontSize: 17))
                ],
              )
            );
          } 
      ),
    );
  }
}