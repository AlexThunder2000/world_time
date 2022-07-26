import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Kyiv', flag: 'Kiev.png', url: 'Europe/Kiev'),
    WorldTime(location: 'New York', flag: 'New_York.png', url: 'America/New_York'),
    WorldTime(location: 'Dubai', flag: 'Dubai.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Tokyo', flag: 'Tokyo.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', flag: 'Sydney.png', url: 'Australia/Sydney'),
    WorldTime(location: 'London', flag: 'London.png', url: 'Europe/London'),
    WorldTime(location: 'Moscow', flag: 'Moscow.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Paris', flag: 'Paris.png', url: 'Europe/Paris'),
    WorldTime(location: 'Rome', flag: 'Rome.png', url: 'Europe/Rome'),

  ];

  void updateTime(index) async{

    WorldTime locationTime = locations[index];
    await locationTime.getTime();
    Navigator.pop(context, {
      'location': locationTime.location,
      'flag': locationTime.flag,
      'time': locationTime.time,
      'isDayTime' : locationTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 35
                  ),
                ),
                leading: CircleAvatar(
                  radius: 25,

                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
