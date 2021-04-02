import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'basic_number.dart';


void main() {
  runApp(NumeroApp());
}

class NumeroApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _grid1 = '';
  String _grid2 = '';
  String _grid3 = '';
  String _grid4 = '';
  String _grid5 = '';
  String _grid6 = '';
  String _grid7 = '';
  String _grid8 = '';
  String _grid9 = '';

  var _gridList = List<String>.filled(10, '');

  String text = "hello";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _getDate() {
    setState(() {
      text = myController.text;
      var parsedDate = DateTime.parse(text);
      int date = parsedDate.day;
      int year = parsedDate.year;
      var basicNumber = getBasicNumber(date);
      var yearUnit = getYearUnit(year);
      var yearDecade = getYearDecade(year);
      _gridList[yearUnit] = _gridList[yearUnit] + yearUnit.toString();
      _gridList[yearDecade] = _gridList[yearDecade] + yearDecade.toString();

      var month1 = getMonthGreaterThanNine(parsedDate.month);
      var month2 = getMonthLessThanNine(parsedDate.month);

      _gridList[month1] = _gridList[month1] + month1.toString();
      _gridList[month2] = _gridList[month2] + month2.toString();

      _gridList[basicNumber] = _gridList[basicNumber] + basicNumber.toString();

      int destinyNumber = getDestinyNumber(parsedDate.day, parsedDate.month, parsedDate.year);
      debugPrint('$destinyNumber');

      _gridList[destinyNumber] = _gridList[destinyNumber] + destinyNumber.toString();

      if(parsedDate.day > 10) {
        int dateUnit = getDateUnit(parsedDate.day);
        int dateTens = getDateTens(parsedDate.day);


        _gridList[dateUnit] = _gridList[dateUnit] + dateUnit.toString();
        _gridList[dateTens] = _gridList[dateTens] + dateTens.toString();
      }


      _grid1 = _gridList[1];
      _grid2 = _gridList[2];
      _grid3 = _gridList[3];
      _grid4 = _gridList[4];
      _grid5 = _gridList[5];
      _grid6 = _gridList[6];
      _grid7 = _gridList[7];
      _grid8 = _gridList[8];
      _grid9 = _gridList[9];


      debugPrint('$_gridList');
    });
  }




  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }



  Row _displayRow() {
    return Row(
      children: [Text('$_counter')],
    );
  }

  Row _buildFirstRow() {
    Widget rows = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              child: Center(
                  child: Text(
                      '$_grid3')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              // color: Colors.orange,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              child: Center(
                child: Text(
                  '$_grid1')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              //color: Colors.green,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              height: 100,
              child: Center(
                  child: Text(
                      '$_grid9')
              ),
            )),
      ],
    );
    return rows;
  }
  Row _buildSecondRow() {
    Widget rows = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              //child: Text('$text'),
              child: Center(
                  child: Text(
                      '$_grid6')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              // color: Colors.orange,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              child: Center(
                  child: Text(
                      '$_grid7')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              //color: Colors.green,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              height: 100,
              child: Center(
                  child: Text(
                      '$_grid5')
              ),
            )),
      ],
    );
    return rows;
  }
  Row _buildThirdRow() {
    Widget rows = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              //child: Text('$text'),
              child: Center(
                  child: Text(
                      '$_grid2')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              // color: Colors.orange,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              child: Center(
                  child: Text(
                      '$_grid8')
              ),
              height: 100,
            )),
        Expanded(
            child: Container(
              //color: Colors.green,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue, spreadRadius: 3),
                ],
              ),
              height: 100,
              child: Center(
                  child: Text(
                      '$_grid4')
              ),
            )),
      ],
    );
    return rows;
  }

  
  Widget datePicker = TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ));


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column( children: [
                Container(
                  width: 200,
                )
              ],),
              Expanded(child: Container(
                child: DateTimeField(
                  format: DateFormat("yyyy-MM-dd"),
                  controller: myController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.date_range),
                    labelText: "Birth Date",
                    hoverColor: Colors.blue
                  ),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                )
                ,
              )),
              Column( children: [
                Container(
                  width: 200,
                )
              ],),
            ],
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Column(children: [
                    Expanded(
                        child: Center(
                          child: Container(
                            height: 300,
                            width: 300,
                            child: Column(children: [
                              Expanded(child: _buildFirstRow()),
                              Expanded(child: _buildSecondRow()),
                              Expanded(child: _buildThirdRow()),
                              //Expanded(child: _displayRow())
                            ]),
                          ),
                        ))
                  ]))
            ]),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _getDate,
        // onPressed: () {
        //   return showDialog(context: context,
        //       builder: (context) {
        //       return AlertDialog(
        //         content: Text(myController.text),
        //       );
        //       });
        // },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
