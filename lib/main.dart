import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_hunt/services/auth_services.dart';
import 'package:recipe_hunt/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Hunt',
      theme: ThemeData
        (
//        primarySwatch: MaterialColor(Colors.red[600]),
      ),
      home: MyLoginPage(title: 'Register User'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key:key);


  final String title;
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String _userName, _emailAddress;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userEmailController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitDetails()
  {
    _userName = userNameController.text;
    _emailAddress = userEmailController.text;
  }

  TextStyle style = TextStyle(fontFamily: 'IndieFlower', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final header = Text('Recipe Hunt',
      style: TextStyle(
          color: Color(0xffff7043),
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
                blurRadius: 5.0,
                color: Colors.grey,
                offset: Offset(3.0, 3.0)
            ),
          ],
          fontFamily: "IndieFlower"
      ),);
    final nameField = TextFormField(
      obscureText: false,
      controller: userNameController,
      style: style,
      validator: (input){
        if(input.isEmpty)
        {
          return 'Please enter your full name';
        }
      },
      onSaved: (input) => _userName = input,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Full Name",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextFormField(
      obscureText: false,
      controller: userEmailController,
      style: style,
      keyboardType: TextInputType.emailAddress,
      validator: (input){
        if(input.isEmpty)
          {
            return 'Please enter email id';
          }
      },
      onSaved: (input) => _emailAddress = input,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final submitButton = Material(

      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffff7043),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: signIn,
        child: Text("Submit",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );


    return Scaffold(

        body: Form(
          key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/registerpagebg.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:45.0),
                    header,
                    SizedBox(height: 45.0),
                    nameField,
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 35.0),
                    submitButton,
                    SizedBox(height: 15.0)

                  ],
                ),
              ),
            )
        )
    );
  }

  Future<void> signIn() async
  {
    final formState = _formKey.currentState;
    if(formState.validate())
      {
        formState.save();
        try{
          Future<String> user = AuthService().signInWithEmailAndPassword(_emailAddress, _userName);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
        catch(e)
        {
          print(e.message);
        }
        //login to firebase
      }
  }
}
