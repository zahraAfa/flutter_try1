import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 1',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'My Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 300;
  int _red = 0;
  int _green = 0;
  int _blue = 255;

  bool _resize = false;
  bool _recolor = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: _resize
              ? [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _size -= 50;
                        });
                      },
                    ),
                  )
                ]
              : [],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
            // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.alarm,
                    size: _size,
                    color: Color.fromRGBO(_red, _green, _blue, 1),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              activeColor: Colors.blue[255],
                              value: _red.toDouble(),
                              min: 0.0,
                              max: 255.0,
                              onChanged: (value) {
                                setState(() {
                                  _red = value.toInt();
                                });
                              },
                            ),
                          ),
                          _recolor
                              ? FloatingActionButton(
                                  backgroundColor: Colors.red[255],
                                  onPressed: () {
                                    setState(() {
                                      _red = 255;
                                      _green = 0;
                                      _blue = 0;
                                    });
                                  },
                                  child: Text("$_red"),
                                )
                              : Text("$_red"),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              activeColor: Colors.blue[255],
                              value: _green.toDouble(),
                              min: 0.0,
                              max: 255.0,
                              onChanged: (value) {
                                setState(() {
                                  _green = value.toInt();
                                });
                              },
                            ),
                          ),
                          _recolor
                              ? FloatingActionButton(
                                  backgroundColor: Colors.green[255],
                                  onPressed: () {
                                    setState(() {
                                      _red = 0;
                                      _green = 255;
                                      _blue = 0;
                                    });
                                  },
                                  child: Text("$_green"),
                                )
                              : Text("$_green"),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              activeColor: Colors.blue[255],
                              value: _blue.toDouble(),
                              min: 0.0,
                              max: 255.0,
                              onChanged: (value) {
                                setState(() {
                                  _blue = value.toInt();
                                });
                              },
                            ),
                          ),
                          _recolor
                              ? FloatingActionButton(
                                  backgroundColor: Colors.blue[255],
                                  onPressed: () {
                                    setState(() {
                                      _red = 0;
                                      _green = 0;
                                      _blue = 255;
                                    });
                                  },
                                  child: Text("$_blue"),
                                )
                              : Text("$_blue"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
