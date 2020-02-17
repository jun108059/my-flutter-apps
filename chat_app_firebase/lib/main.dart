import 'package:flutter/material.dart';
import 'package:chat_app_firebase/screens/welcome_screen.dart';
import 'package:chat_app_firebase/screens/login_screen.dart';
import 'package:chat_app_firebase/screens/registration_screen.dart';
import 'package:chat_app_firebase/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen' : (context) => WelcomeScreen(),
        'login_screen' : (context) => LoginScreen(),
        'registration_screen' : (context) => RegistrationScreen(),
        'chat_screen' : (context) => ChatScreen(),
      },
    );
  }
}
