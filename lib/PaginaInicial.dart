import 'package:flutter/material.dart';
import 'LembretesPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5EBF2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/gif_inicial.gif"),
              backgroundColor: Color(0xFFE5EBF2),
              radius: 200.0,
            ),
            Text(
              "LifEvents",
              style: TextStyle(
                color: Color(0xFF38A3A5),
                fontSize: 48,
                fontFamily: "VarelaRound",
              ),
            ),
            Text(
              "Organize sua vida num só lugar",
              style: TextStyle(
                color: Color.fromARGB(132, 0, 0, 0),
                fontSize: 25,
                fontFamily: "VarelaRound",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(23),
                primary: Color(0xFF38A3A5),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LembretesPage(),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
