import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

main(List<String> args) {
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color firstcol;
  Color seccol;
  String chrono;
  MainAxisAlignment alignment;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  void initState() {
    super.initState();
    alignment = MainAxisAlignment.center;
    firstcol = Colors.blue;
    seccol = Colors.green;
  }

  void _changecol1() {
    firstcol = Colors.amber;
    alignment = MainAxisAlignment.center;
  }

  void _changecol2() {
    seccol = Colors.red;
    alignment = MainAxisAlignment.center;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          top: true,
          child: Center(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: alignment,
                children: [
                  Container(
                    color: Colors.red,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Center(
                          child: StreamBuilder(
                            stream: _stopWatchTimer.rawTime,
                            initialData: _stopWatchTimer.rawTime.value,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              final value = snapshot.data;
                              final displaytime = StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  secondRightBreak: ',',
                                  milliSecond: true);
                              chrono = displaytime.toString();
                              return Text(
                                displaytime,
                                style: TextStyle(fontSize: 30, wordSpacing: 3),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    },
                    child: Text('start'),
                    style: ElevatedButton.styleFrom(primary: firstcol),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(chrono);
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    },
                    child: Text('stop'),
                    style: ElevatedButton.styleFrom(primary: seccol),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                    },
                    child: Text('reset'),
                    style: ElevatedButton.styleFrom(primary: seccol),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
