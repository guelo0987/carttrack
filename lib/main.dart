import 'package:flutter/material.dart';
import 'pages/AuthScreens/splash_screen.dart';

void main() => runApp(const CartApp());

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CartTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Mundial',
      ),
      home: const SplashScreen(),
    );
  }
}
