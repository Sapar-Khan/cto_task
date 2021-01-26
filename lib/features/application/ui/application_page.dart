import 'package:flutter/material.dart';

import 'widgets/card_item.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Количество: 192981',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView(children: [
                CardItem(),
                CardItem(),
                CardItem(),
                CardItem(),
                CardItem(),
                CardItem(),
                CardItem(),
                CardItem(),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
