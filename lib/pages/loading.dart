import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading..';
  void setupWorldTime() async {
    WorldTime wt = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wt.getTime();
    // print(wt.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDayTime': wt.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.white,
        size: 50,
      )),
    );
  }
}
