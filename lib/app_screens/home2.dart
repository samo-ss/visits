import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import './add_button.dart';
//import './app_screens/home1.dart';


class MyHomePage1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

       appBar: AppBar(
         title: Text('Visits'),
         actions: <Widget>[
           IconButton(
             //  icon: Icon(Icons.add_circle),
               icon: Icon(Icons.list),
               iconSize: 40.0,
               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyApp())),
           ),
           IconButton(
               icon: Icon(Icons.add_circle),
             onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddButton())),
           )
         ],

       ),


    //  key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
      Column(children: <Widget>[

        new Container(
       // height: 200,
          child: SafeArea(
        child: new Calendar(
          //showTodayAction: false,
          onSelectedRangeChange: (range) =>
             print("Range is ${range.item1}, ${range.item2}"),
          //print("Range is ${range.item2}"),
          onDateSelected: (date) => {
            //changeDate(date)
          },
        ),
          ),
      ),

      Expanded(
        child: new SizedBox(
          child: new Container(
           // child:
          //  googleMap,
            alignment: Alignment.center,
            color: Colors.blueGrey,
          //  width: 400.0,
            height: 217.0,
            margin: EdgeInsets.only(top: 0.5,bottom: 0.5),

              child:Align(
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

          ),
        ),
      ),
      ])
    ],
    ),
    );

  }
}