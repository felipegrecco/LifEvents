import 'package:flutter/material.dart';

class LembretesPage extends StatelessWidget {
  const LembretesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: AppBar(
                title: Transform.translate(
                  offset: Offset(0, 43.0),
                  child: Text('LifEvents',
                      style: TextStyle(
                          fontFamily: "VarelaRound",
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 35)),
                ),
                shape: RoundedRectangleBorder(),
                titleSpacing: 13,
                backgroundColor: Color(0xFF38A3A5),
                toolbarHeight: 150,
                automaticallyImplyLeading: false,
              ),
            )),
        backgroundColor: Color(0xFFE5EBF2),
        body: null);
  }
}
