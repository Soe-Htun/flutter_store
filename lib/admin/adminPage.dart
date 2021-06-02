import 'package:flutter/material.dart';
import 'package:flutter_store/main.dart';

class Admin extends StatelessWidget {
  Admin({Key key, this.username}) : super(key: key);

  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome from Admin")),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Hello $username',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/');
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Center(
                            child: Text("Logout"),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text("Are you sure to logout")],
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            FlatButton(
                                onPressed: () {
                                  // logout to login page
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ));
              },
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
