import 'package:flutter/material.dart';
import 'custom_painter.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Flutter Animation'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              FadeTransition(
                opacity: _animation,
                child: Container(
                  width: 175,
                  height: 175,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 20),
              RotationTransition(
                turns: _animation,
                child: Container(
                  width: 175,
                  height: 175,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 175,
                  height: 175,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _controller.reset();
                    _controller.forward();
                  },
                  child: Text('Animate!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
