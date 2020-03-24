
import 'package:break_app/models/user.dart';
import 'package:break_app/screens/wrapper.dart';
import 'package:break_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // we're wrapping our root widget in the stream, 
    // so all stream data can be accessed within the root, and therefore
    // the Wrapper widget
    return StreamProvider<User>.value(
      value: AuthService().user,
      // .value is a fxn that takes in the stream we wanna listen to,
      // what data we wanna get back
      child: MaterialApp(
      home: Wrapper(),
        // title: 'Flutter Demo',
        // theme: ThemeData(

        //   primarySwatch: Colors.green,
        // ),
        // home: MyHomePage(title: 'BREAK'),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       end: Alignment.topCenter,
//                                       begin: Alignment.bottomCenter,
//                                       stops: [0.1, 0.9],
//                                       colors: [Color(0xAAaf7ae2), Color(0xAA398ed7)]
//                                     )
//                                   ),
//             child: Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
            
//             Column(mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("BREAK", 
//                     style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,
//                       fontSize: 75,
//                       shadows: [BoxShadow(color: Colors.white, blurRadius: 20.0)]
//                       )
//                 ),

//             const SizedBox(width: 10, height: 50),

//             FlatButton(
//               onPressed: () {Navigator.of(context).push(MaterialPageRoute<Null>(builder:(BuildContext context){
//                 return new SignupScreen();}));
//               },
//               child: Text("SIGN UP", style: TextStyle(fontFamily: 'Montserrat', fontSize: 40,shadows: [BoxShadow(color: Colors.white, blurRadius: 5.0)], color: Colors.white)),
//               color: Colors.transparent,
//               padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0), side: BorderSide(color:Colors.white))
//             ),

//             const SizedBox(width: 10, height: 10),

//             FlatButton(
//               onPressed: () {
//               //   Navigator.of(context).push(MaterialPageRoute<Null>(builder:(BuildContext context){
//               //   return new LoginScreen();}));
//               },
//               child: Text("LOGIN", style: TextStyle(fontFamily: 'Montserrat', fontSize: 40,shadows: [BoxShadow(color: Colors.white, blurRadius: 5.0)], color: Colors.white)),
//               color: Colors.transparent,
//               padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
//               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0), side: BorderSide(color:Colors.white))
//             ),
//               ],)
//           ]
//         )
//       )
//     ),                     
//     );
     
//   }
// }

