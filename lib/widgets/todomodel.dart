class Todo {
  String id;
  String todoText;
  late bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '00', todoText: 'Morning excresise', isDone: true),
      Todo(id: '01', todoText: 'evening excresise', isDone: true),
      Todo(id: '02', todoText: 'kai b', isDone: false),
      Todo(id: '04', todoText: 'thik hai', isDone: true),
      Todo(id: '05', todoText: 'smj gaya', isDone: true),
      Todo(id: '06', todoText: 'ok', isDone: false),
      Todo(id: '07', todoText: 'done', isDone: true),
      Todo(id: '08', todoText: 'dhnyawad', isDone: true),
      Todo(id: '09', todoText: 'Bullying Bulla', isDone: true),
    ];
  }
}
