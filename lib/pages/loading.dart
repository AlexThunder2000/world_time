import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //просто напишу сюди комент
  void setupWorldTime() async{
    WorldTime locationTime = WorldTime(location: 'Kyiv',flag: 'Ukraine',url: 'Europe/Kiev');
    await locationTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': locationTime.location,
      'flag': locationTime.flag,
      'time': locationTime.time,
      'isDayTime' : locationTime.isDayTime,
    });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.newtonCradle(color: Colors.lightBlue, size: 250),
      ),
    );
  }
}
