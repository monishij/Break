import 'package:break_app/services/auth.dart';
import 'package:break_app/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text("BREAK", 
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,
                          fontSize: 75,
                          shadows: [BoxShadow(color: Colors.white, blurRadius: 20.0)]
                          )
                  ),
                Container(height:60),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(hintText: 'password'),
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                FlatButton(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0), 
                      side: BorderSide(
                        color:Colors.white,
                      )
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        // validates the current state of the form, with its
                        // current vals in the formfields
                        // the validate fxn uses validate properties specified by us
                        // in the TextFormField widgets
                        // when pressed, validate() runs the two validator fxns
                        // in the textformfields above
                        // only when it gets null back, we are valid
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(() {
                            error = 'could not sign in with those credentials';
                          });

                        }

                      }
                    }
                  ),
                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14)
                  )
                ],
              ),
          ),
          )
        ),
      );
  }
}
