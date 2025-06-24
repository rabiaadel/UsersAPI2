import 'package:flutter/material.dart';

import 'features/splash/view/screen/LoginScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    ),
  );
}
