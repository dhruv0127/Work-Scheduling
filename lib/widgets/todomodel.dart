class Todo {
  String id;
  String todoText;
  bool isDone;
  DateTime? dueDate;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.dueDate,
  });

  static List<Todo> todoList() {
    final now = DateTime.now();
    final List<Todo> todos = [
      Todo(
          id: '00',
          todoText: 'Complete morning exercise routine',
          isDone: true,
          dueDate: now),
      Todo(
          id: '01',
          todoText: 'Prepare for evening workout',
          isDone: true,
          dueDate: now),
      Todo(
          id: '02',
          todoText: 'Review project proposal',
          isDone: false,
          dueDate: now.add(const Duration(days: 1))),
      Todo(
          id: '03',
          todoText: 'Submit financial report',
          isDone: true,
          dueDate: now.add(const Duration(days: 1))),
      Todo(
          id: '04',
          todoText: 'Revise presentation slides',
          isDone: true,
          dueDate: now.add(const Duration(days: 2))),
      Todo(
          id: '05',
          todoText: 'Research industry trends',
          isDone: false,
          dueDate: now.add(const Duration(days: 2))),
      Todo(
          id: '06',
          todoText: 'Confirm meeting agenda',
          isDone: true,
          dueDate: now.add(const Duration(days: 3))),
      Todo(
          id: '07',
          todoText: 'Send follow-up emails',
          isDone: true,
          dueDate: now.add(const Duration(days: 3))),
      Todo(
          id: '057',
          todoText: '15days after this happen',
          isDone: true,
          dueDate: now.add(const Duration(days: 15))),
      Todo(
          id: '08',
          todoText: 'Prepare client proposal',
          isDone: true,
          dueDate: now.add(const Duration(days: 4))),
    ];

    todos.sort((a, b) {
      if (a.dueDate == null && b.dueDate == null) {
        return 0;
      } else if (a.dueDate == null) {
        return 1;
      } else if (b.dueDate == null) {
        return -1;
      } else {
        return a.dueDate!.compareTo(b.dueDate!);
      }
    });

    return todos;
  }
}
