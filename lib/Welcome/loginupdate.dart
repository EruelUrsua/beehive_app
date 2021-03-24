import 'dart:ui';
import 'package:beehive_app/Focus/focus_main.dart';
import 'package:beehive_app/Landing%20Page/LandingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Bold',
                      fontSize: 35,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SF-Pro-Thin',
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Center(
                child: TextFieldContainer(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_rounded,
                          color: Colors.black45),
                      hintText: "Email",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
              ),
              TextFieldContainer2(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_open_rounded, color: Colors.black45),
                    hintText: "Password",
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'SP-Pro-Thin',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LandingPage()));
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SF-Pro-Bold',
                        color: Colors.white,
                      ),
                    )),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Signup'),
                onPressed: () {
                  auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LandingPage()));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AlreadyHaveAnAccountCheck(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextFieldContainer2 extends StatelessWidget {
  final Widget child;
  const TextFieldContainer2({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Dont have an account? " : "Already have an Account ?",
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'SF-Pro-Thin',
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'SF-Pro-Bold',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}
