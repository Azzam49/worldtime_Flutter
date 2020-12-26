import 'package:flutter/material.dart';
import 'package:worldtime_azzam/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  


  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'London',flag: 'uk.png',url: 'Europe/London'); 
    await instance.getTime();  

    //pushReplacementNamed will switch to home page 
    //without making the loading page runs underneath it
    Navigator.pushReplacementNamed(
      context, 
      '/home',
      // used to send data to other pages
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
  }

  @override
  void initState(){
    super.initState();
    setUpWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: SpinKitCubeGrid(
              color: Colors.red,
              size: 50.0,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,20.0),
            child: Text(
              "Created By Azzam",      
              style: TextStyle(
                //fontFamily: 'indieflower',
                fontSize: 28.0,
                color: Colors.redAccent[600],
                wordSpacing: 3.0,
                
              ),
              
              ),
          ),
        )
      ],
    ),
  ),
      
    );
  }
}