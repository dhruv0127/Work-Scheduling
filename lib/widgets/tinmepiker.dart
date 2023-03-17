import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todomodel.dart';

class Timeonetwo extends StatefulWidget {
  const Timeonetwo({super.key});

  @override
  State<Timeonetwo> createState() => _TimeonetwoState();
}

class _TimeonetwoState extends State<Timeonetwo> {
  void _datepicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  bool doneaa = false;
  late final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  late final ontodochange;
  // ignore: prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Someting"),
          ),
          body: Row(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      doneaa = !doneaa;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: doneaa
                              ? const Color.fromARGB(255, 76, 96, 175)
                              : const Color.fromARGB(255, 175, 76, 76)),
                      borderRadius: BorderRadius.circular(80),
                      color: doneaa
                          ? const Color.fromARGB(40, 0, 13, 255)
                          : const Color.fromARGB(40, 255, 0, 0),
                    ),
                    width: 70,
                    height: 40,
                    child: Center(
                        child: Text(
                      "Done",
                      style: TextStyle(
                          decoration:
                              doneaa ? null : TextDecoration.lineThrough,
                          fontSize: 14,
                          color: doneaa
                              ? Color.fromARGB(255, 0, 50, 130)
                              : Color.fromARGB(255, 130, 11, 0),
                          fontWeight: FontWeight.bold),
                    )),
                  )),
              InkWell(
                  onTap: _datepicker,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 76, 96, 175)),
                        borderRadius: BorderRadius.circular(80),
                        color: Color.fromARGB(40, 0, 13, 255)),
                    width: 80,
                    height: 40,
                    child: const Center(
                        child: Text(
                      "Due Date",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 50, 130),
                          fontWeight: FontWeight.bold),
                    )),
                  )),
            ],
          )),
    );
  }
}
