import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './home2.dart';
import './add_button.dart';
import './home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(

      title: 'Listview',
      home: new MyHomePage(title: 'Visits'),
    );
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.map),
             // onPressed: null)
             onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage1())),
          ),
    IconButton(
        icon: Icon(Icons.add_circle),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddButton())),
    )


        ],
      ),
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

    child:ListPage(),


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
    QuerySnapshot qn= await firestore.collection("customer").getDocuments();



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

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (__, index) {
                    return ListTile(
                    //  title: Text(snapshot.data[index].data["visitedId"]),
                      title: Text(snapshot.data[index].data["businessName"]),
                     subtitle: Text(snapshot.data[index].data["businessAddress"]),


                    // onTap: Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()))

                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });
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
      body: HomePage(),
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

