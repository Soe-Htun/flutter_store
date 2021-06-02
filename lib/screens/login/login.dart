import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  String  msg='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              // Text("Username",
              // style: TextStyle(fontSize: 18),
              // ),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: "Username"
                ),
              ),
              // Text("Password",
              // style: TextStyle(fontSize: 18),
              // ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),

              SizedBox(height: 10,),
              RaisedButton(
                onPressed: (){
                  loginAction();
                },
                child: Text("Login"),
              ),

              Text(msg,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List> loginAction() async{
    var url= Uri.parse("http://192.168.234.1/flutter/flutter_store/signin.php");
    final response = await http.post(url, body: {
      "username": userController.text,
      "password": passController.text
    });

    // var datauser = json.decode(response.body);
    var datauser= jsonDecode(response.body);

    if(datauser.length ==0){
      setState(() {
        msg ="Login Fail";
      }
      );
    }
    else{
      if(datauser[0]['level'] == 'admin'){
        print("welcome admin");
        Navigator.pushNamed(context, '/AdminPage');
      }
      else if(datauser[0]['level'] == 'member'){
        print("Welcome member");
        Navigator.pushNamed(context, '/MemberPage');
      }
      // else if(datauser[0]['password'] != passController.text){
      //   Fluttertoast.showToast(msg: "Incorrect password", toastLength: Toast.LENGTH_SHORT);
      // }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;

    //print( "Res=>>>> ${response.body}");
  }
}