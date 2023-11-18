import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF38A3A5)),
            borderRadius: BorderRadius.circular(8.0),
            color: isChecked
                ? const Color.fromARGB(255, 44, 175, 48)
                : Colors.white,
          ),
          child: isChecked
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
