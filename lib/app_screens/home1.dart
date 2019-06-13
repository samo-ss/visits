import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
              icon: Icon(Icons.add_circle), onPressed: null
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

              child: ListPage(),

             /* child: new SizedBox(
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
                                  child: Text(snapshot.data[index].data["visitedId"]),
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
              ),*/
            ),
          ])
        ],
      ),
    );

  }
}
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}


class _ListPageState extends State<ListPage> {
  //getPosts()   {

  // Firestore.instance.collection('visit').snapshots().listen((data) {
  //  data.documents.map((ds) {
  //   Text(ds['visit_id']);
  //});
  //});
  //}
//
  Future _data;
  Future getPosts() async {
    //var firestore = Firestore.instance.collection('visit').snapshots();
    var firestore= Firestore.instance;
    QuerySnapshot qn= await firestore.collection("visit").getDocuments();



    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
  }

  @override
  void initState(){
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: getPosts(),
//      child: StreamBuilder(
      child: FutureBuilder(
        // future: getPosts(),
          future: _data,
          //stream: Firestore.instance.collection('visit').snapshots(),

          builder: (context, snapshot){


            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: Text('Loading..'),
              );
            }else {



               return SizedBox(
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

                          //items: [1,2,3,4,5].map((i) {
                           items: [1,2].map((i) {

                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  child: Text(snapshot.data["visit"]),
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
              );



           /*   return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (__, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].data["visitedId"]),


                      onTap: null,

                      // onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });


              */
            }
          }),
    );
  }
}
class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Text(widget.post.data["title"]) ,
      //),
      //body:Container(

      //child:  Card(
      //child: ListTile(
      //title:Text(widget.post.data["title"]),
      //subtitle: Text(widget.post.data["content"]),

      //  ),
      //  ),
      //)

    );

  }
}

