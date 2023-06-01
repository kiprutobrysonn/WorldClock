import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:worldclock/services/Location_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {

void setTime() async{
  TimeLocations  instance = TimeLocations(Location:"Kenya", flags:'assets/flags/kenya', urlLocation:'Africa/Nairobi');
  await instance.loadData();
  Navigator.pushReplacementNamed(context, '/Home',arguments: {
    'location':instance.Location,
    'flag': instance.flags,
    'time':instance.time,
    'bgimage':instance.bgImage
  });

}

  @override
  void initState() {
  setTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[700],
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}
