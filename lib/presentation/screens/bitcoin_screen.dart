import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/scrollable_bitcoin_view.dart';

/// Экран, на котором будет осуществляться работа с получением цены биткоина
class BitcoinScreen extends StatefulWidget {
  @override
  _BitcoinScreenState createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестовое задание'),
      ),
      body: Center(
        child: ScrollableBitcoinView(),
      ),
    );
  }
}
