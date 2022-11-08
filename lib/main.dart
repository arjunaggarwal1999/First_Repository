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

  Widget screen1TextWidget() {
    screen_1_no++;
    if (screen_1_no > 3) {
      screen_1_no = 0;
    }
    return (Padding(
        padding: EdgeInsets.only(top: 20.0, left: 8.0),
        child: SizedBox(
            height: 200,
            width: 400,
            child: ElevatedButton(
                onPressed: () {
                  var savedVal = setState(() {
                    // Problem is here
                    // screen_1_list = [A, B, C, D]
                    // screen_1_no = 3
                    selected_screen_1_text = screen_1_list[screen_1_no];

                    if (selected_screen_1_text == 'A') {
                      selected_screen_1_variable = a;
                    } else if (selected_screen_1_text == 'B') {
                      selected_screen_1_variable = b;
                    } else if (selected_screen_1_text == 'C') {
                      selected_screen_1_variable = c;
                    } else {
                      selected_screen_1_variable = d;
                    }

                    print(screen_1_no);
                    screen_1_loop_limit = selected_screen_1_variable.length;
                    shouldDisplay = !shouldDisplay;
                  });
                },
                child: Text(
                  screen_1_list[screen_1_no],
                  style: TextStyle(fontSize: 50),
                )))));
  }

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
            backgroundColor: Color.fromARGB(255, 16, 219, 155)),
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
                      padding: EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                selected_screen_1_variable = a;
                                screen_1_loop_limit =
                                    selected_screen_1_variable.length;
                                shouldDisplay = !shouldDisplay;
                              },
                              child: Text(
                                'A',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('B');
                              },
                              child: Text(
                                'B',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('C');
                              },
                              child: Text(
                                'C',
                                style: TextStyle(fontSize: 50),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 8.0),
                      child: SizedBox(
                          height: 200,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                set_screen2_text('D');
                              },
                              child: Text(
                                'D',
                                style: TextStyle(fontSize: 50),
                              )))),
                ],
              ),
            ),
            Container(
              child: VerticalDivider(),
            ),

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
                      children: [
                        for (var i = 0; i < screen_1_loop_limit; i++)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                shouldDisplay = true;
                              });
                            },
                            child: shouldDisplay
                                ? Text(
                                    selected_screen_1_variable[i],
                                    style: TextStyle(fontSize: 50),
                                  )
                                : Text(""),
                          )
                      ])
                  // SizedBox(
                  //   height: 60,
                  //   width: 300,
                  //   child: TextButton(
                  //       onPressed: () {},
                  //       child: shouldDisplay
                  //           ? Text(
                  //               'Text 1',
                  //               style: TextStyle(fontSize: 50),
                  //             )
                  //           : Spacer()
                  //       // style: ElevatedButton.styleFrom(
                  //       //   minimumSize: Size.fromHeight(40),
                  //       // )
                  //       ),
                  // ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: shouldDisplay
                  //       ? Text(
                  //           'Text 2',
                  //           style: TextStyle(fontSize: 50),
                  //         )
                  //       : Spacer(),
                  // )
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Text 3',
                  //       style: TextStyle(fontSize: 50),
                  //     )),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Text 4',
                  //       style: TextStyle(fontSize: 50),
                  //     )),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Text 5',
                  //       style: TextStyle(fontSize: 50),
                  //     )),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Text 6',
                  //       style: TextStyle(fontSize: 50),
                  //     )),
                  // ],
                  ),
            ),
            Container(
              child: VerticalDivider(),
            ),

            // Third screen
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Text 3',
                      style: TextStyle(fontSize: 50),
                    ))
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
    shouldDisplay = !shouldDisplay;
  }
}







//Working on a demo project to @vinitmp15                                                                                                                                         `