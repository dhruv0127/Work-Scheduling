import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todomodel.dart';

class Todoitem extends StatelessWidget {
  const Todoitem(
      {super.key, required this.todo, this.ontodochange, this.ondeleteitem});

  final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  final ontodochange;
  // ignore: prefer_typing_uninitialized_variables
  final ondeleteitem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ListTile(
          title: Text(
            todo.todoText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // print("todo tapped");
            ontodochange(todo);
          },
          splashColor: const Color.fromARGB(255, 211, 219, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          tileColor: const Color.fromARGB(255, 255, 255, 255),
          leading: Icon(
            todo.isDone ? Icons.check_circle : Icons.circle_outlined,
            color: Colors.purple,
            // size: 15,
          ),
          trailing: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {
                ondeleteitem(todo.id);
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(40, 255, 0, 0),
                  ),
                  width: 60,
                  height: 30,
                  child: const Center(
                      child: Text(
                    "Remove",
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          )),
    );
  }
}
