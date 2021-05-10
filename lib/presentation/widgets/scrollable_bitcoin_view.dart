import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/bitcoint_button.dart';

/// Виджет для мультипросмотра цены биткоина
class ScrollableBitcoinView extends StatefulWidget {

  @override
  _ScrollableBitcoinViewState createState() => _ScrollableBitcoinViewState();
}

class _ScrollableBitcoinViewState extends State<ScrollableBitcoinView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
      ),
      child: ListView.builder(
        itemCount: 500,
        itemBuilder: (context, index) => BitcoinButton(),
      ),
    );
  }
}
