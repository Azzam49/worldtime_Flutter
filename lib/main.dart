import 'package:flutter/material.dart';
import 'package:worldtime_azzam/pages/choose_location.dart';

import 'package:worldtime_azzam/pages/home.dart';
import 'package:worldtime_azzam/pages/loading.dart';

void main() {
  runApp(MaterialApp(  

    //changes the initial route
    initialRoute: '/',

    //routes having a Map datatype
    routes: {
      //base route (1st screen)
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => ChooseLocation(),
    },
  ));
}
