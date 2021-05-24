import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

int count = 1;
main(List<String> args) {
  runApp(Myhomepage());
}

class Myhomepage extends StatelessWidget {
  const Myhomepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.red,
        child: Column(
          children: [Blue(), Green()],
        ),
      ),
    );
  }
}

class Green extends StatefulWidget {
  const Green({
    Key key,
  }) : super(key: key);

  @override
  _GreenState createState() => _GreenState();
}

class _GreenState extends State<Green> {
  Color _col;

  @override
  void setState(fn) {
    super.setState(fn);

    if (count > 2) {
      _col = Colors.red;
    } else {
      _col = Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.red,
      child: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: Text('test'),
        style: ElevatedButton.styleFrom(primary: _col),
      ),
    );
  }
}

class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  GlobalKey<_GreenState> textGlobalKey = new GlobalKey<_GreenState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: ElevatedButton(
          onPressed: () {
            count++;
            setState(() {});
            print(count);
          },
          child: Text('test')),
    );
  }
}
