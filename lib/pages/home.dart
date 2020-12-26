import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// because we arn't using appBar, we use SafeArea
//widget to push things little bit down
class _HomeState extends State<Home> {

  //map to recieve data coming from the loading page
  Map data = {};

  @override
  Widget build(BuildContext context) {

    //this recives the map of data from loading page and store it at data map
    //-
    // ternary operator to load data from loading page on initial creation of home page
    //but everytime we choose location we update data only from choose location page
    //through the navigator args
    data =  data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // set background image
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    
    
    return Scaffold(
      //changes background color for top info bar of phone
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    //Navigator.pushNamed pushes the routed page
                    //on top of the current page
                    //-
                    //we are getting data from choose_location screen
                    //by awaiting for going and choosing location as a
                    //big action and then we store data coming from
                    //choose_location on result variable
                    //-
                    //we used dynamic datatype because we don't know what
                    //result variable will return, maybe an error?
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    //to update the UI with new data
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                    ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                      )
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}