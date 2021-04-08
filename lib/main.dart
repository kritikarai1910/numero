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
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

      int destinyNumber =
          getDestinyNumber(parsedDate.day, parsedDate.month, parsedDate.year);
      debugPrint('$destinyNumber');

      _gridList[destinyNumber] =
          _gridList[destinyNumber] + destinyNumber.toString();

      if (parsedDate.day > 10) {
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

  void _clearFields() {
    setState(() {
      myController.clear();
      _grid1 = '';
      _grid2 = '';
      _grid3 = '';
      _grid4 = '';
      _grid5 = '';
      _grid6 = '';
      _grid7 = '';
      _grid8 = '';
      _grid9 = '';
    });
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget _buildFirstRow() {
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
          child: Center(child: Text('$_grid3')),
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
          child: Center(child: Text('$_grid1')),
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
          child: Center(child: Text('$_grid9')),
        )),
      ],
    );
    return rows;
  }

  Widget _buildSecondRow() {
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
          child: Center(child: Text('$_grid6')),
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
          child: Center(child: Text('$_grid7')),
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
          child: Center(child: Text('$_grid5')),
        )),
      ],
    );
    return rows;
  }

  Widget _buildThirdRow() {
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
          child: Center(child: Text('$_grid2')),
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
          child: Center(child: Text('$_grid8')),
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
          child: Center(child: Text('$_grid4')),
        )),
      ],
    );
    return rows;
  }

  List<DropdownMenuItem<int>> getItems() {
    String year = "19";
    List<DropdownMenuItem<int>> items = [];
    
    for(int i =50;i< 100; i++)
    items.add(DropdownMenuItem(child: Text(year + i.toString()),
    value: i,));


    year = "200";

    for(int i =0;i< 10; i++)
      items.add(DropdownMenuItem(child: Text(year + i.toString()),
        value: i,));


    year = "20";

    for(int i =10;i< 50; i++)
      items.add(DropdownMenuItem(child: Text(year + i.toString()),
        value: i,));
    return items;


  }

  int _value = 50;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();


    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 50,
                  )
                ],
              ),
              Expanded(
                  child: Container(
                child: DateTimeField(
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                  key: formKey,
                  format: DateFormat("yyyy-MM-dd"),
                  controller: myController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.date_range),
                      labelText: "Birth Date",
                      hoverColor: Colors.blue),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              )),
              Column(
                children: [
                  Container(
                    width: 50,
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 50,
                  )
                ],
              ),
              Container(child:

               Icon(
                  Icons.timeline
                ),
              ),
              Container(
                width: 15,
              ),
              Expanded(
                child: DropdownButton(
                    value: _value,
                    items:
                      getItems(),
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
              ),
              Column(
                children: [
                  Container(
                    width: 50,
                  )
                ],
              )
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
                    ]),
                  ),
                ))
              ]))
            ]),
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  Expanded(
                      child: TextButton(
                          child: Text("Get grid",
                              style: TextStyle(color: Colors.white)),
                          onPressed: _getDate,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ))),
                  Container(width: 20),
                  Expanded(
                      child: TextButton(
                    child: Text(
                      "Clear",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _clearFields,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  )),
                  Container(
                    width: 50,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
