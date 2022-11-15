import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screen_1_list = ['A', 'B', 'C', 'D'];
  var screen_1_loop_limit = 0;
  var screen_1_no = -1;
  var selected_screen_1_variable = [];
  var screen_2_selected_text = "";
  var children = <Widget>[];
  var a = [
    'Text 1',
    'Text 2',
    'Text 3',
    'Text 4',
    'Text 5',
    'Text 6',
    'Text 7',
    'Text 8',
    'Text 9',
    'Text 10'
  ];
  var b = [
    'Text 3',
    'Text 4',
    'Text 5',
    'Text 6',
  ];
  var c = [
    'Text 4',
    'Text 5',
    'Text 6',
    'Text 7',
  ];
  var d = [
    'Text 1',
    'Text 2',
    'Text 3',
    'Text 4',
  ];

  String selected_screen_1_text = '';
  bool shouldDisplay = false;
  bool shouldDisplay_2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // App Bar
        appBar: AppBar(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/peppermint_services_white.png',
                fit: BoxFit.contain,
                height: 70,
              ),
            ]),
            backgroundColor: const Color.fromARGB(255, 16, 219, 155)),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Screen
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('A');
                              },
                              child: const Text(
                                'A',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('B');
                              },
                              child: const Text(
                                'B',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('C');
                              },
                              child: const Text(
                                'C',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('D');
                              },
                              child: const Text(
                                'D',
                                style: TextStyle(fontSize: 50),
                              )))),
                ],
              ),
            ),

            const VerticalDivider(),

            // Second screen
            SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children)),
            ),

            const VerticalDivider(),

            // Third screen
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: shouldDisplay_2
                        ? Text(
                            screen_2_selected_text,
                            style: const TextStyle(fontSize: 50),
                          )
                        : const Text(""))
              ],
            ),
          ],
        ));
  }

  void set_screen2_text(String s) {
    selected_screen_1_text = s;
    if (selected_screen_1_text == 'A') {
      selected_screen_1_variable = a;
    } else if (selected_screen_1_text == 'B') {
      selected_screen_1_variable = b;
    } else if (selected_screen_1_text == 'C') {
      selected_screen_1_variable = c;
    } else {
      selected_screen_1_variable = d;
    }
    screen_1_loop_limit = selected_screen_1_variable.length;
    // print(selected_screen_1_text);
    // print(screen_1_loop_limit);
    shouldDisplay = !shouldDisplay;

    // Resetting children to empty list each time the user clicks a button
    children = <Widget>[];

    for (var i = 0; i < screen_1_loop_limit; i++) {
      children.add(TextButton(
        onPressed: () {
          screen_2_selected_text = selected_screen_1_variable[i];
          shouldDisplay_2 = !shouldDisplay_2;
          // print(screen_2_selected_text);
          setState(() {
            // shouldDisplay = true;
          });
        },
        child: shouldDisplay
            ? Text(
                selected_screen_1_variable[i],
                style: const TextStyle(fontSize: 50),
              )
            : const Text(""),
      ));
    }

    setState(() {});

    // print(children);
  }
}







//Working on a demo project to @vinitmp15                                                                                                                                         `