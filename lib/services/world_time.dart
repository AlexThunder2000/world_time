import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  late String location ;
  late String time;
  late String flag;
  late String url;
  bool isDayTime = true;

  WorldTime({ required this.location, required this.flag, required this.url});

  Future <void> getTime() async {

    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);

    time = (data['datetime'].substring(11,16));
    isDayTime = int.parse(time.substring(0,2)) > 6 && int.parse(time.substring(0,2)) < 20 ? true : false;

  }

}

