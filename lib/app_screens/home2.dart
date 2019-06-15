import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import './add_button.dart';
//import './app_screens/home1.dart';
import 'package:g2x_week_calendar/g2x_simple_week_calendar.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';




void main() => runApp(MyHomePage1());

class MyHomePage1 extends StatelessWidget {


  Color colour;


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


  DateTime startDate;
  DateTime endDate;
  Color color;



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
                    mapType: MapType.hybrid,
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
            /*new Positioned(
          child: CarouselSlider(
              //items: null
            height: 150.0,
            enableInfiniteScroll: false,

            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    //  child: Text(snapshot.data[index].data["visitedId"]),
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





          )*/


            new Positioned(
              top: 60.0,
              left: 7.0,
              right: 55.0,



              child: Column(children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width),
                  child: StreamBuilder<QuerySnapshot>(
    //QuerySnapshot qn= await firestore.collection("customer").getDocuments();
                    stream: Firestore.instance
                       .collection('customer')
                        .document("businessAddress")
                        //.collection("customer")
                        //.document("businessName")
                        .collection("Visit")
                     //   .where("createdDate", isGreaterThanOrEqualTo: startDate,
                       // isLessThanOrEqualTo: endDate)
                    .where("visitedId", isEqualTo: "Name1")
                        .snapshots(),
   // QuerySnapshot qn= await firestore.collection("customer").getDocuments();
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
                        default:
                          return new ListView(
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              print("task.care date is " +
                                  document['createdDate'].toString());

                              return document['status'] == 'login' ? Card(
                                margin: EdgeInsets.only(
                                  left: 10.0, right: 10.0,),
                                child: new ListTile(
                                  title: new Text(
                                   // document['businessName'].toString(),
                                    document['businessName'],

                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: new Text(
                                    //document['loginGeoPoint'].toString(),
                                    document['location'].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),

                              //    trailing: Image.asset(
                                //    "assets/login.png",
                                  //  width: 12.0,
                                  //),
                                ),
                              ) : Column(
                                children: <Widget>[
                                  Card(
                                    color: Colors.blueGrey,
                                    child: Column(

                                      children: <Widget>[
//                                          new Text('Login'),
//                                          new Text('Logout'),
                                        new ListTile(
                                          title: new Text(
                                            document['createdDate'].toString(),
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          subtitle: new Text(
                                           // document['loginGeoPoint']
                                          document['location']
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        //  trailing: Image.asset(
                                         //   "assets/login.png",
                                         //   width: 12.0,
                                          //),
                                        ),
                                        new ListTile(

                                          title: new Text(
                                            document['createdDate'].toString(),
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          subtitle: new Text(
                                            //document['logoutGeoPoint']
                                              document['location']
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                       //   trailing: Image.asset(
                                           // "assets/logout.png",
                                          //  width: 12.0,
                                         // ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              );
                            }).toList(),
                          );
                      }
                    },
                  ),

   /*               child: ListView(
                          children: <Widget>[
                            Center(
                              child: ListTile(
                                title: Text('List tile 1'),
                              ),
                            ),
                            Center(
                              child: ListTile(
                                title: Text('List tile 2'),
                              ),
                            ),
                            Center(
                              child: ListTile(
                                title: Text('List tile 3'),
                              ),
                            ),
                            Center(
                              child: ListTile(
                                title: Text('List tile 4'),
                    //          ),
                      //      ),
                      //    ],
                        ),
                        */
                ),
              ]),
            ),
          ],
          )
     );
  }
}


