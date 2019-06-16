import 'dart:async';
//import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import './add_button.dart';
import 'package:g2x_week_calendar/g2x_simple_week_calendar.dart';
//import 'package:intl/intl.dart';
//import 'package:location/location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';




void main() => runApp(MyHomePage1());

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.971599, 77.594566),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(12.971599, 77.594566),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  DateTime dateCallback;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      appBar: AppBar(
        title: Text('Visits'),
        actions: <Widget>[
          IconButton(
            //  icon: Icon(Icons.add_circle),
            icon: Icon(Icons.list),
            iconSize: 40.0,
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => MyApp())),
          ),
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => AddButton())),
          )
        ],

      ),
    body: Stack(
    children: <Widget>[
    Column(children: <Widget>[

    new Container(
    //height:100,
    child: SafeArea(

    child: G2xSimpleWeekCalendar(
    DateTime.now(), dateCallback: (date) => dateCallback,
    selectedTextStyle: const TextStyle(
    color: Colors.blueAccent),)
    ),
    ),

      Expanded(
        child: new SizedBox(
        //child: new Container(
        child: Container(
          //height: 500.0,
      child: GoogleMap(
        //myLocationButtonEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        //mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
        ),
        ),
      ),
      ],
    ),

      new Positioned(
          top: 600.0,
          left: 7.0,
          right: 40.0,
          child: CarouselSlider(
              //items: null
            height: 120.0,
            enableInfiniteScroll: false,
          //  itemCount: snapshot.data.length,

         //   items: [1, 2, 3, 4, 5].map((i) {
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
                builder: (BuildContext context) {
                  return Container(
                      child: Text("container"),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),

                    //child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),





          )
      
      
      
      
      )
      ],
    ),

   // ];
   // ),
    );
  }
}


