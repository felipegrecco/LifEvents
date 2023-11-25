class Task {
  int id;
  String nome;
  DateTime data;
  int prioridade;
  String horaInicio, horaFim;

  Task({
    required this.id,
    required this.nome,
    required this.data,
    required this.prioridade,
    required this.horaFim,
    required this.horaInicio,
  });
}
