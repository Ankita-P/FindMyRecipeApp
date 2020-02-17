import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Hunt'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/screen1_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Text(
          'Welcome to Recipe Hunt!',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'IndieFlower',
          ),
        ),
        ),

      )
    );
  }
}
