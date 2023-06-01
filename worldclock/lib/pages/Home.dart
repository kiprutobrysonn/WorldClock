import 'package:flutter/material.dart';
import 'package:worldclock/pages/SetLocation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};
  @override
  Widget build(BuildContext context) {
    data = (data!.isNotEmpty) ? data : ModalRoute
        .of(context)
        ?.settings
        .arguments as Map?;

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${data?['bgimage']}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, '/SetLocation');
                    setState(() {
                      data = {
                        'flag': result['flag'],
                        'location': result['location'],
                        'bgimage': result['bgimage'],
                        'time': result['time'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Change location",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 2.0,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "${data?['location']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${data?['time']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}