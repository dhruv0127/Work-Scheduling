import 'package:flutter/material.dart';

class Addingpage extends StatefulWidget {
  const Addingpage({super.key});

// final Todo todo;
  @override
  State<Addingpage> createState() => _AddingpageState();
}

double bottomcontainerheight = 400;

class _AddingpageState extends State<Addingpage> {
// double mxwidth = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const Addingpage()));
                    },
                    icon: const Icon(Icons.arrow_back_sharp)),
                const Text("Add your work"),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                height: bottomcontainerheight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              onTap: () => setState(() {
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
                      children: [
                        Container(
                          width: 160,
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 0),
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
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
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
                                "Date :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text("27/02/2022")
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          )),
    );
  }
}



            // todo.isDone ? Icons.check_circle : Icons.circle_outlined,