import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ),
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
