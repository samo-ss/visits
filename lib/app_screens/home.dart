//import 'dart:async';
//import 'dart:io';
import 'package:flutter/material.dart';
import './check_out.dart';
import 'package:swipe_button/swipe_button.dart';


class HomePage extends StatelessWidget {



 String data1="Check In";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    appBar:AppBar(
      title: Text('Visit details'),
    ),
    body: Center(

      child: Column(

        children: <Widget>[

          Container(
            alignment: Alignment.topLeft,
            child: Text('example'),
            color: Colors.white,
            // width: 400.o,
            height: 120.0,
            margin: EdgeInsets.only(top: 0.75, bottom:0.75),
          ),

          Container(
            alignment: Alignment.topLeft,
            child: Text('Phone:\n Mail:'),
            color: Colors.white,
            //width: 400.0,
            height: 80.0,
            margin: EdgeInsets.only(top: 0.75, bottom: 0.75),
          ),


          Container(
            alignment: Alignment.topLeft,
            child: Text('Last visited on: \n No of visits done:'),
            color: Colors.white,
            //width: 400.0,
            height: 80.0,
            margin: EdgeInsets.only(top: 0.75, bottom: 0.75),
          ),

          Container(
            alignment: Alignment.topLeft,
            child: Text('Visit description:'),
            color: Colors.white,
            //width: 400.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 0.75, bottom: 0.75),
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text('Schedule:'),
              color: Colors.white,
              //width: 400.0,
              height: 80.0,
              margin: EdgeInsets.only(top: 0.75, bottom: 0.75),
         // child: swipeWidget()
          ),
        Container(
      alignment: Alignment.topLeft,
      child: Text('Notes:'),
      color: Colors.white,
      //width: 400.0,
      height: 100.0,
      margin: EdgeInsets.only(top: 0.75, bottom: 0.75),
      // child: swipeWidget()
    ),

    Expanded(

           child: Padding(
              padding: const EdgeInsets.only(top:110.0, bottom: 40.0,right: 0.5,left: 1.0),
              child: SwipeButton(
                thumb: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                        child:IconButton(
                  icon: Icon(Icons.keyboard_arrow_right, size: 30.0,color: Colors.white,),
                          //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage1())),
                          //  Icon(Icons.arrow_forward,size: 20.0,color:buttonName == "login" ? loginColour : logoutColour,),
                  

                        )
                    ),
                  ],
                ),
               content: Center(
                  child: Text(
                   //buttonTitle,
                   data1,

                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                   // textAlign: TextAlign.center,
                   // overflow: TextOverflow.ellipsis,
                  ),
                ),
                onChanged: (result) {
                  if (result == SwipePosition.SwipeRight) {
                    //print("Loading");
                    //Navigator.pushNamed(context, PageRoute;
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage1()));
                  } else {}
                },
              ),

            ),
          ),

        ],
      ),
    )
    );
  }
}

