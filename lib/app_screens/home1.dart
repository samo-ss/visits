import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import './add_button.dart';
import 'package:g2x_week_calendar/g2x_simple_week_calendar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class MyHomePage1 extends StatelessWidget {

  String buttonName = null;
  Color colour;
  String error;
  LocationData location;

  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 8,
  );

  CameraPosition _currentCameraPosition;
  GoogleMap googleMap;

   DateTime dateCallback;

  @override
  Widget build(BuildContext context) {
    googleMap = GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      initialCameraPosition: _initialCamera,
      onMapCreated: (GoogleMapController controller) {
        //  _controller.complete(controller);
      },
    );


    // TODO: implement build
    return Scaffold(

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


      //  key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[

            new Container(
              height: 170,
              child: SafeArea(

                  child: G2xSimpleWeekCalendar(
                    DateTime.now(), dateCallback: (date) => dateCallback,
                    selectedTextStyle: const TextStyle(
                        color: Colors.blueAccent),)
                //selectedTextStyle = const TextStyle(color: Colors.red),)

/*


        child: Calendar(

          onSelectedRangeChange: (range) =>
            // print("Range is ${range.item1}, ${range.item2}"),
          print("Range is ${range.item1}"),
          onDateSelected: (date) => {
            //changeDate(date)
          },
        ),

*/


              ),
            ),

            Expanded(
              child: new SizedBox(
                //child: new Container(
                child: Container(
                  //child:
                    child:
                    googleMap
                  //alignment: Alignment.center,
                  //color: Colors.blueGrey,
                  //  width: 400.0,
                  // height: 217.0,
                  //margin: EdgeInsets.only(top: 0.5,bottom: 0.5),


                  /*            child:
              Align(
                  alignment: Alignment(-1.0, 0.75),


                  child:  CarouselSlider(
                    height: 150.0,
                    enableInfiniteScroll: false,

                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                          //  child: Text(snapshot.data[index].data["visitedId"]),
                            width: MediaQuery.of(context).size.width,
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

*/


                ),
              ),
            ),
          ],
          ),

          /*  child:
          Align(
              alignment: Alignment(-1.0, 0.75),
*/

          new Positioned(
              right: 15.0,
              left: 15.0,
              bottom: 10.0,
              child: Column(
                children: <Widget>[
                  Container(
                    color:Colors.blue,
                    child: SizedBox(
                      height: 55,

                      width: double.infinity,
                      //
                      /* child: swipeWidget(
                      buttonName != null ?
                        SwipeButton(

                          onChanged: (result) {
                            if(result == SwipePosition.SwipeRight) {
                              //print('Swiped to right');
                              if (controller != null && controller.value.isInitialized) {
                                  onTakePictureButtonPressed();
                                  setStatus(buttonName);
                                  initialPosition: SwipePosition.SwipeLeft;
                                  SwipeButton._

                              }
                             }
                          },
                          clr: colour,
                          content: Center(child: Text(buttonName)),
                          initialPosition: SwipePosition.SwipeLeft,
                          height: (MediaQuery.of(context).size.width) / 8,
                          thumb: Icon(Icons.arrow_forward),
                        ): Container(),
                      */
                    ),
                  )
                ],
              )
          ),

          new Positioned(
            top: 110.0,
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
                  stream: Firestore.instance
                      .collection('customer')
                      .document('businessName')
                      .collection("customer")
                      .document('businessAddress')
                      .collection("visit")
                  //.where("createdDate", isGreaterThanOrEqualTo: startDate, isLessThanOrEqualTo: endDate)
                      .snapshots(),
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
                                document['date'].toString());

                            return document['status'] == 'login' ? Card(
                              margin: EdgeInsets.only(
                                left: 10.0, right: 10.0,),
                              child: new ListTile(
                                title: new Text(
                                  document['date'].toString(),

                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: new Text(
                                  document['loginGeoPoint'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),

                                trailing: Image.asset(
                                  "assets/login.png",
                                  width: 12.0,
                                ),
                              ),
                            ) : Column(
                              children: <Widget>[
                                Card(
                                  //color: greyColor2,
                                  color: Colors.blueGrey,
                                  child: Column(

                                    children: <Widget>[
//                                          new Text('Login'),
//                                          new Text('Logout'),
                                      new ListTile(
                                        title: new Text(
                                          document['date'].toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        subtitle: new Text(
                                          document['loginGeoPoint'].toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: Image.asset(
                                          "assets/login.png",
                                          width: 12.0,
                                        ),
                                      ),
                                      new ListTile(

                                        title: new Text(
                                          document['date'].toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        subtitle: new Text(
                                          document['logoutGeoPoint'].toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: Image.asset(
                                          "assets/logout.png",
                                          width: 12.0,
                                        ),
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
                //


                /*child: ListView(
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
                              ),
                            ),
                          ],
                        ),*/
              ),
            ]),
          ),


        ],
      ),
    );
  }

}

/* swipeWidget() {
    new Positioned(
      //right: 30.0,
        bottom: 10.0,
        child: Column(
          children: <Widget>[
            Container(
              child: SizedBox(
                height: (MediaQuery
                    .of(context)
                    .size
                    .width) / 8,
                width: (MediaQuery
                    .of(context)
                    .size
                    .width),
                child:
                buttonName != null ?
                SwipeButton(

                  onChanged: (result) {
                    if (result == SwipePosition.SwipeRight) {
                      //print('Swiped to right');
                      if (controller != null &&
                          controller.value.isInitialized) {
                        onTakePictureButtonPressed();
                        setStatus(buttonName);
                      }
                    }
                  },
                  clr: colour,
                  content: Center(child: Text(buttonName)),
                  initialPosition: SwipePosition.SwipeLeft,
                  height: (MediaQuery
                      .of(context)
                      .size
                      .width) / 8,
                  thumb: Icon(Icons.arrow_forward),
                ) : Container(),
              ),
            )
          ],
        )
    );
  }
}

  return buttonName != null ?

  SwipeButton(

    onChanged: (result) {
      if (result == SwipePosition.SwipeRight) {
        //print('Swiped to right');
        if (controller != null && controller.value.isInitialized) {
          onTakePictureButtonPressed();
          setStatus(buttonName);
        }
      }
    },
    clr: colour,
    //content: Center(child: Text(buttonName)),
    content: buttonName,
    initialPosition: itpos,
    height: (MediaQuery
        .of(context)
        .size
        .width) / 8,
    thumb: Icon(Icons.arrow_forward,size: 20.0,color:buttonName == "login" ? loginColour : logoutColour,),
  ) : Container();
}
}
*/