import 'package:flutter/material.dart';
import 'package:worldclock/services/Location_Time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<TimeLocations> locations = [
    TimeLocations(
        Location: "Liechtenstein",
        flags: 'assets/flags/lichenstein.png',
        urlLocation: "Europe/Vaduz"),
    TimeLocations(
        Location: "Congo",
        flags: "assets/flags/congo.jpg",
        urlLocation: "Africa/Kinshasa"),
    TimeLocations(
        Location: "Kenya",
        flags: "assets/flags/kenya.jpeg",
        urlLocation: "Africa/Nairobi"),
    TimeLocations(
        Location: "Lesotho",
        flags: "assets/flags/lesotho.jpg",
        urlLocation: "Africa/Maseru"),
    TimeLocations(
        Location: "Australia",
        flags: "assets/flags/australian.png",
        urlLocation: "Australia/Canberra"),
    TimeLocations(
        Location: "Thailand",
        flags: "assets/flags/thailand.jpeg",
        urlLocation: "asia/Bangkok"),
    TimeLocations(
        Location: "USA",
        flags: "assets/flags/usa.jpg",
        urlLocation: "America/New_York")
  ];

  void updateTime(index) async{
    TimeLocations instance= locations[index];
    await instance.loadData();
    Navigator.pop(context, {
      'location':instance.Location,
      'flag': instance.flags,
      'time':instance.time,
      'bgimage':instance.bgImage
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.black38,
          title: Text("SET LOCATION"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Verdana",
            color: Colors.white,
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.grey[800],
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text("${locations[index].Location}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:AssetImage('${locations[index].flags}'),
                ),
                ));
            },
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        mouseCursor: MouseCursor.defer,
        child: Icon(Icons.add),


      ),
    );
  }
}
