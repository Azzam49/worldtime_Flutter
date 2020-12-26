import 'package:flutter/material.dart';
import 'package:worldtime_azzam/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

   List<WorldTime> locations = [
   
    WorldTime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'sudan.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudiarabia.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkey.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala Lumpur', flag: 'malaysia.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  ];

  void updateTime(index) async{
    //storing instance inside WorldTime data
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    //we use .pop() because home screen is underneath the
    //choose location screen
    //when poping when dont use arguments property to send
    //data, we send data directly
    Navigator.pop(context,{
      'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,//removes the shadow effect of appbar
      ),
      body: ListView.builder(
        itemCount: locations.length,
        //build tree widget for each location in the list
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              //ListTile a type of card that allows image + text
              child: ListTile(
                // runs function when pressing the Card
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                //image of the ListTile
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}