import 'package:flutter/material.dart';

// The main function is the starting point for all out Flutter apps.
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('YoungJun Is Rich'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: Image(
              image: NetworkImage('https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/3r5K/image/_1tvEq9L3V0j7EwlsFbLLRmJ6gs.jpg'),
            ),
          ),
        ),
      ),
    );
