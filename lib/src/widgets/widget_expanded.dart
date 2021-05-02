import 'package:flutter/material.dart';
import 'package:widget_challenge/src/models/song_model.dart';

class WidgetExpanded extends StatefulWidget {
  
  const WidgetExpanded({Key key}) : super(key: key);

  @override
  _WidgetExpandedState createState() => _WidgetExpandedState();
}

class _WidgetExpandedState extends State<WidgetExpanded> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation<double> _animation;

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta <= 1) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    
    _animation = CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width / 4;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: 15 * (1 - _animation.value),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding * (1 - _animation.value)),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFF5534ff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30 * (1 - _animation.value)),
                  bottomRight: Radius.circular(30 * (1 - _animation.value)),
                )
              ),
              child: Center(
                child: SizedBox(
                  height: size.height / (8 - (6.3 * _animation.value)),
                  width: size.width / (2 - (0.7 * _animation.value)),
                  child: Stack(
                    children: [
                      _albumDetail(),
                      _gradientRegion(size),
                      _buttons()
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _albumDetail() {
    return Positioned(
      left: 0,
      right: 0,
      top: 10,
      child: Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: Column(
          children: [
            GestureDetector(
              onVerticalDragUpdate: _onVerticalGesture,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(playedList[0].imagePath,
                  fit: BoxFit.fill,
                  width: 110,
                  height: 110,
                )
              ),
            ),
            SizedBox(height: 2.0),
            Text(playedList[0].artistName, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15)),
            SizedBox(height: 2.0),
            Text(playedList[0].titleSong, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      )
    );
  }

  Widget _gradientRegion(Size size) {
    return Positioned(
      left: 0,
      right: 0,
      top: size.height / 3,
      child: Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFfAE52FF).withOpacity(0.5),  
                Color(0xFf4C65F6).withOpacity(0.5), 
                Color(0xFf4C65F6).withOpacity(0.5), 
                Color(0xFf3981E9).withOpacity(0.5), 
                Color(0xFfAE52FF).withOpacity(0.5)],
            )
          ),
          child: Center(
            child: Text('l', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
          )
        ),
      )
    );
  }

  Widget _buttons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10 + (15 * _animation.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _leftButton(),
          _centerButton(),
          _rightButton()
        ],
      )
    );
  }

  Widget _leftButton() {
    return _animation.value > 0.0 ? 
      Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: Icon(Icons.repeat, color: Colors.white),
      ) :
      Icon(Icons.copy, color: Colors.white);
  }

  Widget _centerButton() {
    return _animation.value > 0.0 ? 
      Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: Icon(Icons.pause, color: Colors.white),
      ) :
      GestureDetector(
        child: CircleAvatar(radius: 25, backgroundImage: AssetImage(playedList[0].imagePath)),
        onTap: () {
          _animationController.forward(from: 0.0);
        },
      );
  }

  Widget _rightButton() {
    return _animation.value > 0.0 ? 
      Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: Icon(Icons.skip_next, color: Colors.white),
      ) :
      CircleAvatar(radius: 17, backgroundImage: AssetImage('assets/images/avatar.png'));
  }
  
}