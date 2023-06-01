import 'package:flutter/material.dart';
import 'package:worldclock/pages/Home.dart';
import 'package:worldclock/pages/Loading.dart';
import 'package:worldclock/pages/SetLocation.dart';




void main() {
  runApp(

    MaterialApp(
     routes: {
       "/":(context)=>Load(),
       "/Home":(context)=>Home(),
       "/SetLocation":(context)=> new Location()
     },
    )
  );
}
