import 'package:break_app/services/auth.dart';
import 'package:break_app/shared/constants.dart';
import 'package:break_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: Text(''),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('SIGN IN'),
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
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'password'),
                    obscureText: true,
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
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          error = 'Please supply a valid email/password';
                          loading = false;
                        });
                      }
                    }
                  }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}