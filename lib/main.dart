import 'package:flutter/material.dart';
import 'package:flutter_store/admin/adminPage.dart';
import 'package:flutter_store/member/memberPage.dart';
import 'package:flutter_store/screens/login/login.dart';

void main() {
  runApp(MyApp());
}
String username='';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: Login(),
      // routes: <String, WidgetBuilder>{
      //   '/AdminPage': (BuildContext context) => new Admin(),
      // },
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/' : (context) => Login(),
        '/AdminPage' : (context) => Admin(username: username),
        '/MemberPage' : (context) => MemberPage()
      },
    );
  }
}
