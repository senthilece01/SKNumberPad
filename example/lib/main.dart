import 'package:flutter/material.dart';
import 'package:sk_numberpad_example/otp_screen.dart';

import 'login_screen.dart';

var routes = <String, WidgetBuilder>{
  "/OTPScreen": (BuildContext context) => OTPScreen(),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
