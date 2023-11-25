// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifevents/Task.dart';
import 'CheckButton.dart';
import 'CreateTask.dart';

import 'abc.dart';
import 'dart:convert';

class LembretesPage extends StatefulWidget {
  const LembretesPage({super.key});

  @override
  State<LembretesPage> createState() => _LembretesPageState();
}

class _LembretesPageState extends State<LembretesPage> {
  int _taskIdCounter = 1;
  List<Task> tasks = [];
  abc db = abc();

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

        //BODY

        body: Column(children: [
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 350,
                      height: 40,
                      child: Text(
                        'Nada por enquanto...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.49000000953674316),
                          fontSize: 24,
                          fontFamily: 'Varela Round',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      width: 361,
                      height: 312,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/done.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ]))
                : ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 37, right: 37, top: 5, bottom: 16),
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: corPrioridade(tasks[index].prioridade),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 120,
                        width: 355,
                        child: Container(
                          padding: EdgeInsets.only(left: 17, top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    tasks[index].nome,
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.699999988079071),
                                      fontSize: 24,
                                      fontFamily: 'Varela Round',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CheckButton(),
                                      SizedBox(
                                        width: 28.5,
                                      )
                                    ],
                                  ))
                                ]),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/calendar.png'),
                                    SizedBox(width: 9),
                                    Text(
                                      "${DateFormat('EEEE', 'pt_BR').format(tasks[index].data)} - ${DateFormat('d', 'pt_BR').format(tasks[index].data)}, ${DateFormat('MMMM', 'pt_BR').format(tasks[index].data)}",
                                      style: TextStyle(
                                        color: Colors.black
                                            .withOpacity(0.699999988079071),
                                        fontSize: 16,
                                        fontFamily: 'Varela Round',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/clock.png'),
                                    SizedBox(width: 9),
                                    Text(
                                      "${tasks[index].horaInicio} - ${tasks[index].horaFim}",
                                      style: TextStyle(
                                        color: Colors.black
                                            .withOpacity(0.699999988079071),
                                        fontSize: 16,
                                        fontFamily: 'Varela Round',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              tasks.removeAt(index);
                                              db.saveData(tasks);
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7.5,
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ]),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Color(0xFF38A3A5),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTask(
                      onAdd: (newTask) {
                        setState(() {
                          newTask.id = _taskIdCounter++;
                          tasks.add(newTask);
                          tasks.sort((a, b) => a.data.compareTo(b.data));
                          db.saveData(tasks);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Color(0xFF38A3A5),
              ),
              onPressed: () {
                setState(() {
                  tasks = tasks.reversed.toList();
                });
              },
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 35,
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          )
        ]));
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

  @override
  void initState() {
    super.initState();

    db.readData().then(
      (data) {
        setState(() {
          tasks = json.decode(data!);
        });
      },
    );
  }
}
