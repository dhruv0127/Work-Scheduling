import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/items.dart';
import '../widgets/tinmepiker.dart';
import '../widgets/todomodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final todoList = Todo.todoList();
  final _todocontroller = TextEditingController();

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
        body: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "All TODOs",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        addButton()
                      ],
                    ),
                  ),
                  for (Todo i in todoList)
                    Todoitem(
                      todo: i,
                      ontodochange: _handlechnge,
                      ondeleteitem: _deletetodo,
                    ),
                ],
              ),
            ),
          ],
        ),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Timeonetwo()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
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

  double bottomcontainerheight = 200;
  Future custombottomsheet() {
    return showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 232, 232, 232),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22), topRight: Radius.circular(22))),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: bottomcontainerheight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22)),
                  color: Color.fromARGB(255, 232, 232, 232),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 6,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 3),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 10,
                              color: Color.fromARGB(255, 234, 241, 255),
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        // color: const Color.fromARGB(255, 245, 247, 255),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Work name :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 0.2),
                                color: const Color.fromARGB(255, 224, 241, 255),
                                borderRadius: BorderRadius.circular(22)),
                            child: TextField(
                              controller: _todocontroller,
                              onTap: () => setState(() {
                                _addtodoitem(_todocontroller.text);
                                bottomcontainerheight = 10000;
                              }),
                              decoration: const InputDecoration(
                                hintText: "Input Your Todo",
                                hintStyle: TextStyle(color: Colors.blue),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 170,
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 0, bottom: 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 234, 241, 255),
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.circular(22),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            // color: const Color.fromARGB(255, 245, 247, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Status :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    "Is Done",
                                    style: TextStyle(color: Colors.blue[900]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 0, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 234, 241, 255),
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.circular(22),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            // color: const Color.fromARGB(255, 245, 247, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Due Date :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 8, left: 14, right: 0),
                                child: Text("27/02/2022"),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  void _addtodoitem(String todo) {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todocontroller.clear();
  }
  
  Widget addButton() {
    return InkWell(
        onTap: () => setState(() {
              bottomcontainerheight = 220;
              custombottomsheet();
            }),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.green),
            borderRadius: BorderRadius.circular(80),
            color: const Color.fromARGB(81, 108, 244, 54),
          ),
          width: 140,
          height: 50,
          child: const Center(
              child: Text(
            "NEW +",
            style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 11, 130, 0),
                fontWeight: FontWeight.bold),
          )),
        ));
  }

  Widget searchbox() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        width: 265,
        height: 39,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: const Color.fromARGB(255, 136, 135, 135))
        ),
        child: const TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.5),
              border: InputBorder.none,
              hintText: " Search",
              prefixIcon: Icon(Icons.search),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25)),
        ));
  }
}
