import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/bitcoin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'test_app', home: BitcoinScreen()
  );
}
