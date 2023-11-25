// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Task.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CreateTask extends StatefulWidget {
  final Function(Task) onAdd;

  CreateTask({required this.onAdd});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _titleController = TextEditingController();
  TextEditingController horaStart = TextEditingController();
  TextEditingController horaEnd = TextEditingController();

  int numPrioridade = 0;
  int _taskIdCounter = 1;

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
      body: Container(
          padding: EdgeInsets.only(top: 30, left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Vamos criar uma nova tarefa!",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 22,
                  fontFamily: 'Varela Round',
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Tarefa',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  fillColor: Colors.white),
              style: TextStyle(
                fontFamily: 'Varela Round',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DateTimePicker(
              decoration: InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  fillColor: Colors.white),
              type: DateTimePickerType.date,
              dateMask: 'dd/MM/yyyy',
              initialValue: DateFormat('dd/MM/yyyy').format(selectedDate),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
              onChanged: (val) => setState(() {
                selectedDate = DateTime.parse(val);
              }),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              controller: horaStart,
              decoration: InputDecoration(
                  labelText: 'Horário de início',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  fillColor: Colors.white),
              style: TextStyle(
                fontFamily: 'Varela Round',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.datetime,
              controller: horaEnd,
              decoration: InputDecoration(
                  labelText: 'Horário de fim',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  fillColor: Colors.white),
              style: TextStyle(
                fontFamily: 'Varela Round',
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color(0xFF38A3A5)),
                onPressed: () {
                  _showOptionsDialog(context);
                },
                child: Text(
                  'Prioridade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Varela Round',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    widget.onAdd((Task(
                      id: _taskIdCounter++,
                      nome: _titleController.text.isNotEmpty
                          ? _titleController.text
                          : 'Nova Tarefa',
                      data: selectedDate,
                      prioridade: numPrioridade,
                      horaInicio:
                          horaStart.text.isNotEmpty ? horaStart.text : '',
                      horaFim: horaEnd.text.isNotEmpty ? horaEnd.text : '',
                    )));
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]))
            ]),
          ])),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text('Selecione uma prioridade'),
          children: [
            SimpleDialogOption(
                onPressed: () {
                  numPrioridade = 1;
                  Navigator.pop(context);
                },
                child: menuPrioridade(1)),
            SimpleDialogOption(
                onPressed: () {
                  numPrioridade = 2;
                  Navigator.pop(context);
                },
                child: menuPrioridade(2)),
            SimpleDialogOption(
                onPressed: () {
                  numPrioridade = 3;
                  Navigator.pop(context);
                },
                child: menuPrioridade(3)),
            SimpleDialogOption(
                onPressed: () {
                  numPrioridade = 4;
                  Navigator.pop(context);
                },
                child: menuPrioridade(4)),
          ],
        );
      },
    ).then((selectedOption) {});
  }

  Row menuPrioridade(int prioridade) {
    String image;
    String text;
    switch (prioridade) {
      case 1:
        image = 'assets/images/red.png';
        text = 'Prioridade 1';
      case 2:
        image = 'assets/images/yellow.png';
        text = 'Prioridade 2';
      case 3:
        image = 'assets/images/blue.png';
        text = 'Prioridade 3';
      case 4:
        image = 'assets/images/grey.png';
        text = 'Prioridade 4';
      default:
        image = "";
        text = '';
    }

    return Row(children: [
      Image.asset(image),
      SizedBox(width: 9),
      Text(text),
    ]);
  }
}
