import 'package:http/http.dart';
import 'package:worldclock/pages/Home.dart';
import 'package:worldclock/pages/Loading.dart';
import 'package:worldclock/pages/SetLocation.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeLocations{

  String? Location;
   String? time;
   String? flags;
   String? urlLocation;
   String? bgImage;



  TimeLocations({required this.Location,required this.flags,required this.urlLocation});

  Future <void> loadData() async {
    var url = Uri.https('worldtimeapi.org', '/api/timezone/${urlLocation}');
    Response response= await  get (url);
    Map data =jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().trim().substring(1,3);
    int correctHour=0;
    if(data['utc_offset'].toString()[0]=='-'){
      correctHour= int.parse(offset)* (-1);
    } else {
      correctHour =int.parse(offset);
    }


    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: correctHour));
    time = DateFormat.jm().format(now);
    if(now.hour>6 && now.hour<=9){
      bgImage="assets/time/morning.jpg";

    } else if(now.hour> 10 && now.hour<=15){
      bgImage ="assets/time/midday.jpeg";
    } else if(now.hour > 16 && now.hour<= 19){
       bgImage='assets/time/susnet.jpeg';
    } else {
      bgImage="assets/time/night.jpeg";
    }
  }

  }



