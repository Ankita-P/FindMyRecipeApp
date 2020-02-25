import 'package:flutter/material.dart';
import 'package:recipe_hunt/services/auth_services.dart';

final primaryColor = const Color(0xffff7043);

class SignUpView extends StatefulWidget{
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/registerpagebg.jpg"),
              fit: BoxFit.cover
          )
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(child: Column(
        children: <Widget>[
          Text("SignUp")
        ],
      ),)
    );
  }
}