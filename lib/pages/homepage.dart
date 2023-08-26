import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/items.dart';
import '../widgets/todomodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final todoList = Todo.todoList();
  List<Todo> _foundTodo = [];
  final _todocontroller = TextEditingController();
  bool radioIsDone = false;
  DateTime? currentDate;
  DateTime? selectedDueDate;

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 239, 239, 239),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              searchbox(),
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/bunny.jpg'))
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _foundTodo.length,
                  itemBuilder: (context, index) {
                    final todo = _foundTodo[index];

                    // Check if the current todo's due date is different from the previous one
                    if (currentDate != todo.dueDate) {
                      currentDate = todo.dueDate;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (currentDate != null) ...[
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                              child: Text(
                                _formatDueDate(currentDate!),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                          Todoitem(
                            todo: todo,
                            ontodochange: _handlechnge,
                            ondeleteitem: _deletetodo,
                          ),
                        ],
                      );
                    }

                    return Todoitem(
                      todo: todo,
                      ontodochange: _handlechnge,
                      ondeleteitem: _deletetodo,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            firstDialogbox();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  String _formatDueDate(DateTime date) {
    if (date.isSameDay(DateTime.now())) {
      return "Today";
    } else if (date.isSameDay(DateTime.now().add(const Duration(days: 1)))) {
      return "Tomorrow";
    } else {
      return DateFormat("dd/MM/yyyy")
          .format(date); // Correct usage of DateFormat
    }
  }

  void _handlechnge(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deletetodo(String nid) {
    setState(() {
      todoList.removeWhere((item) => item.id == nid);
    });
  }

// other fun ************************************************

  Future<void> firstDialogbox() async {
    final TextEditingController todocontroller = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 232, 232, 232),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: const Color.fromARGB(255, 232, 232, 232),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 70,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 3),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 10,
                            color: Color.fromARGB(255, 234, 241, 255),
                            offset: Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Work name :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blue, width: 0.2),
                              color: const Color.fromARGB(255, 212, 211, 255),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: TextField(
                              controller: todocontroller,
                              decoration: const InputDecoration(
                                hintText: "Input Your Todo",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 21, 30, 196)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              width: 115,
                              // height: 90,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    color: Color.fromARGB(255, 234, 241, 255),
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(22),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Status :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    color: radioIsDone
                                        ? const Color.fromARGB(255, 5, 207, 25)
                                        : const Color.fromARGB(
                                            255, 212, 211, 255),
                                    onPressed: () {
                                      setState(() {
                                        radioIsDone = !radioIsDone;
                                      });
                                    },
                                    child: Text(
                                      radioIsDone ? 'Done' : 'Pending',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: radioIsDone
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 21, 30, 196),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Container(
                            width: 165,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 234, 241, 255),
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(22),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Due Date :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color:
                                      const Color.fromARGB(255, 212, 211, 255),
                                  child: const Text('Show Date Picker ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 21, 30, 196))),
                                  onPressed: () {
                                    _showDatePicker();
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            MaterialButton(
              color: const Color.fromARGB(255, 29, 17, 96),
              child: const Text('Ok', style: TextStyle(color: Colors.white)),
              onPressed: () {
                _addtodoitem(todocontroller.text, selectedDueDate);
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              // color: Colors.grey[600],
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 17, 96),
                  )),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        selectedDueDate = value;
      });
    });
  }

  Future<void> _showSecondDialog(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // Second dialog box content
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    focusedDay: selectedDate,
                    firstDay: DateTime(2021),
                    lastDay: DateTime(2030),
                    calendarFormat: CalendarFormat.month,
                    onDaySelected: (date, focusedDay) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text("Selected Date: ${selectedDate.toLocal()}"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the second dialog
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addtodoitem(String todo, DateTime? dueDate) {
    setState(() {
      todoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todo,
        isDone: radioIsDone,
        dueDate: dueDate, // Set the due date here
      ));
      _todocontroller.clear();
      radioIsDone = false;
      selectedDueDate = null;
    });
  }

  void runFilter(String enteredkeyword) {
    List<Todo> results = [];

    if (enteredkeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((items) => items.todoText
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodo = results;
    });
  }

  Widget searchbox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      width: 325,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: const Color.fromARGB(255, 136, 135, 135))
      ),
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: (value) {
          runFilter(value); // Call runFilter with the entered search query
        },
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
