import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(
          title: Text('Visits'),

        ),
        body: Align(
          alignment: Alignment.bottomRight,

          child: IconButton(
              icon: Icon(Icons.add_circle,color: Colors.blueAccent,),
              iconSize: 100.0,

              onPressed: null,
          ),
        ),
    );
  }
}