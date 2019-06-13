import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import './home.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:firebase_codelab/libs/swipe_button.dart';
import 'package:swipe_button/swipe_button.dart';


class HomePage1 extends StatelessWidget {



  String data1="Check out";
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
                height: 560.0,
                margin: EdgeInsets.only(top: 0.75, bottom:0.75),
              ),

              Expanded(

                child: Padding(
                  padding: const EdgeInsets.only(top:110.0, bottom: 40.0,right: 0.5,left: 1.0),
                  child: SwipeButton(
                    thumb: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          //  widthFactor: 0.00,
                          // heightFactor: 1.0,
                            child:
                            Icon(
                              Icons.keyboard_arrow_right,
                              //size: 60.0,
                              size: 30.0,
                              color: Colors.white,
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
                        print("Loading");
                        // Navigator.pushNamed(context, pageRoute);
                        Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
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

