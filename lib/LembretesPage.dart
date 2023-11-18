// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifevents/Task.dart';
import 'CheckButton.dart';
import 'CreateButton.dart';

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
      body: ListView(
        children: [
          createTask(
              new Task(
                  nome: "Teste",
                  data: DateTime.now(),
                  horaInicio: TimeOfDay.now(),
                  horaFim: TimeOfDay.now(),
                  prioridade: 1),
              context),
          createTask(
              new Task(
                  nome: "Teste",
                  data: DateTime.now(),
                  horaInicio: TimeOfDay.now(),
                  horaFim: TimeOfDay.now(),
                  prioridade: 1),
              context),
          SizedBox(
            height: 25,
          ),
          CreateButton(),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Container createTask(Task task, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 37, right: 37, top: 16, bottom: 16),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: corPrioridade(task.prioridade),
      ),
      height: 115,
      width: 355,
      child: Container(
        padding: EdgeInsets.only(left: 25, top: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            task.nome,
            style: TextStyle(
              color: Colors.black.withOpacity(0.699999988079071),
              fontSize: 24,
              fontFamily: 'Varela Round',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Image.asset('assets/images/clock.png'),
              SizedBox(width: 9),
              Text(
                "${timeToString(task.horaInicio, context)} - ${timeToString(task.horaFim, context)}",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 16,
                  fontFamily: 'Varela Round',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(width: 180),
              CheckButton()
            ],
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Image.asset('assets/images/calendar.png'),
              SizedBox(width: 9),
              Text(
                "${DateFormat('EEEE', 'pt_BR').format(task.data)} - ${DateFormat('d', 'pt_BR').format(task.data)}, ${DateFormat('MMMM', 'pt_BR').format(task.data)}",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 16,
                  fontFamily: 'Varela Round',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  String timeToString(TimeOfDay time, BuildContext context) {
    return time.format(context);
  }

  Color corPrioridade(int prioridade) {
    switch (prioridade) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
