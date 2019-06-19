import 'dart:async';
//import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import './add_button.dart';
import './home.dart';
import 'package:g2x_week_calendar/g2x_simple_week_calendar.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';




void main() => runApp(MyHomePage1());

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      // home: MapSample(),
      home: FireMap(),
    );
  }
}

//class MapSample extends StatefulWidget {
class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();


//State<MapSample> createState() => MapSampleState();
//State<FireMap> createState() => FireMapState();

}

//class MapSampleState extends State<MapSample> {
class FireMapState extends State<FireMap> {
  Completer<GoogleMapController> _controller = Completer();

  // GoogleMapController mapController;

  // Firestore firestore = Firestore.instance;
  //Geoflutterfire geo = Geoflutterfire();

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
                    myLocationEnabled: true,
                    // myLocationButtonEnabled:_addMarker(),
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    // initialCameraPosition: CameraPosition(target: LatLng(12.971599, 77.594566), zoom: 10),
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },

                    markers: {
                      cust1Marker, cust2Marker
                    },

                  ),
                ),
              ),
            ),

          ],
          ),


          _buildContainer(context),
        ],
      ),

      // ];
      // ),
    );
  }

  Marker cust1Marker = Marker(
    markerId: MarkerId('cust1'),
    position: LatLng(12.9128836, 77.6144108999994),
    infoWindow: InfoWindow(title: 'kunal'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueBlue,
    ),
  );
  Marker cust2Marker = Marker(
    markerId: MarkerId('cust2'),
    position: LatLng(12.916157, 77.628691),
    infoWindow: InfoWindow(title: 'saharsh'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueBlue,
    ),
  );

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 15)));
  }


  @override
  Widget _buildContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          // width: 100.0,
          height: 100.0,
          child:StreamBuilder(
              stream:Firestore.instance.collection('customer').snapshots(),

              builder:(context,snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading..");
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,

                    itemBuilder: (context, index) =>
                        _boxes(context, 12.9128836, 77.6144108999994,
                            snapshot.data.documents[index]),
                    //"kunal"),

//                scrollDirection: Axis.horizontal,
//                child: <Widget>[
//                  SizedBox(width: 10.0,),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: _boxes(context,
//                        12.9128836, 77.6144108999994, "Kunal"
//
//                    ),
//                  )
//
                    //     );
                    //    }
                    //       );
                    //   }

//
//          ListView(
//          scrollDirection: Axis.horizontal,
//          children: <Widget>[
//            SizedBox(width: 10.0),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: _boxes(context,
//                  12.9128836, 77.6144108999994, "Kunal"
//              ),
//              /*     child: _boxes(
                    //                 "https://www.google.com/search?q=pickcel+bangalore&client=ubuntu&hs=4WV&channel=fs&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjM5cnJ5e3iAhXI6Y8KHR1vC0UQ_AUIESgC&biw=1299&bih=639#imgrc=6kuh62vgmvC7sM:",
                    //                12.916157, -77.628691, "Pickcel"),*/

                    //           ),
//            SizedBox(width: 10.0),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: _boxes(context,
//                  12.916157, 77.628691, "Saharsh"
//              ),
//              /*    child: _boxes(
//                  "https://www.google.com/search?q=pickcel+bangalore&client=ubuntu&hs=4WV&channel=fs&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjM5cnJ5e3iAhXI6Y8KHR1vC0UQ_AUIESgC&biw=1299&bih=639#imgrc=6kuh62vgmvC7sM:",
//                  12.916157, -77.62, "Pickcel2"),*/
                  );
                }
              }

          )
        //    ],
      ),
    );
    //  ),
    //);
  }

  @override
  //Widget _boxes(BuildContext context,String _image, double lat, double long, String custName) {
  Widget _boxes(BuildContext context, double lat, double long, DocumentSnapshot document) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        width: 100.0,

//
//        child: SizedBox(
//          height: 500,
//            width: 100,
//          child: new FittedBox(
//            fit: BoxFit.fitWidth,
//            child:Padding(padding:const EdgeInsets.all(8.0),
//            child: Material(
//              color: Colors.white,
//              elevation: 14.0,
//              borderRadius: BorderRadius.circular(3.0),
        // shadowColor: Colors.blueGrey,
        //            child: SizedBox(
        //              width: 10.0,
        // height: 100,
        child: FittedBox(


          fit: BoxFit.fitWidth,
          child:Card(
            color: Colors.white,

            child:Padding(padding:const EdgeInsets.all(8.0),

              child: Row(


                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    //mainAxisSize: MainAxisSize.max,

                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                      Text(document['businessName'] ),

                    ],
                  ),
                  Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(

                          child: IconButton(icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: () =>
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) => HomePage())
                                ),
                          )


                      ),
                    ],
                  )
                  /*      Container(
                        width: 600,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(12.0),
                          child: Image(
                            //fit: BoxFit.fill,
                            fit: BoxFit.fill,
                            image: NetworkImage(_image),
          o            ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _myDetailsContainer(),

                        ),
                      )*/
                ],
              ),
            ),
          ),
//            )
        ),
      ),
    );
    // ),
    //   );
  }


/* Widget _myDetailsContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
         // padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
              child:IconButton(icon: Icon(Icons.keyboard_arrow_right),

                  onPressed:
                      () => Navigator.push(context, MaterialPageRoute
                    (builder: (BuildContext context) => HomePage())),

              )

   /*          child: Text(custName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,

                ),

              )*/

    ),
        ),
        // SizedBox(height: 5.0),
        // Container(
        // child: ,
        //)
      ],
    );
  }
*/

}




