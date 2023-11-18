import 'package:flutter/material.dart';

class Task {
  String nome;
  DateTime data;
  TimeOfDay horaInicio, horaFim;
  int prioridade;

  Task({
    required this.nome,
    required this.horaInicio,
    required this.horaFim,
    required this.data,
    required this.prioridade,
  });
}
