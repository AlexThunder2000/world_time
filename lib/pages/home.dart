import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Object? parameters ;
  Map data  = {};
  @override
  Widget build(BuildContext context) {

    parameters = ModalRoute.of(context)!.settings.arguments;
    data = data.isNotEmpty ? data : jsonDecode(jsonEncode(parameters));
    print(data);

    String bgImage = data['isDayTime'] ? "assets/day.png" : "assets/night.png";


    return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
                onPressed: () async{
                 dynamic result = await Navigator.pushNamed(context, "/location");
                 if(result['location']=='Moscow'){
                   result['location'] = 'Ах ти агент кремля -_-';
                 };
                 setState((){
                   data = {
                     'time': result['time'],
                     'location': result['location'],
                     'isDayTime': result['isDayTime'],
                   };
                 });
                 },
                icon: const Icon(Icons.edit_location, color: Colors.white,),
                label: const Text('edit location', style: TextStyle(color: Colors.white),),

            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Text(data['time'],
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
