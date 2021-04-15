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

  Container _getGridBox(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.blue, spreadRadius: 3),
        ],
      ),
      height: 100,
      child: Center(child: Text('$text')),
    );
  }

  Widget _buildRow(String box1, String box2, String box3) {
    Widget rows = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _getGridBox(box1)),
        Expanded(child: _getGridBox(box2)),
        Expanded(child: _getGridBox(box3))
      ],
    );
    return rows;
  }

  Widget _getDateTimePicker(GlobalKey<FormState> formKey) {
    return DateTimeField(
      style: TextStyle(fontSize: 15),
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
    );
  }

  Widget _getYearDropdown() {
    return DropdownButton(
        value: _value,
        items: getItems(),
        onChanged: (int? value) {
          setState(() {
            _value = value!;
          });
        });
  }

  List<DropdownMenuItem<int>> getItems() {
    String year = "19";
    List<DropdownMenuItem<int>> items = [];

    for (int i = 50; i < 100; i++)
      items.add(DropdownMenuItem(
        child: Text(year + i.toString()),
        value: i,
      ));

    year = "200";

    for (int i = 0; i < 10; i++)
      items.add(DropdownMenuItem(
        child: Text(year + i.toString()),
        value: i,
      ));

    year = "20";

    for (int i = 10; i < 50; i++)
      items.add(DropdownMenuItem(
        child: Text(year + i.toString()),
        value: i,
      ));
    return items;
  }

  Widget _getClearButton() {
    return TextButton(
      child: Text(
        "Clear",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _clearFields,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
    );
  }

  Widget _getGridButton() {
    return TextButton(
      child: Text(
        "Get Grid",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _getDate,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
    );
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
              Expanded(child: Container(child: _getDateTimePicker(formKey))),
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
              Container(
                child: Icon(Icons.timeline),
              ),
              Container(
                width: 15,
              ),
              Expanded(
                child: _getYearDropdown(),
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
                      Expanded(child: _buildRow(_grid3, _grid1, _grid9)),
                      Expanded(child: _buildRow(_grid6, _grid7, _grid5)),
                      Expanded(child: _buildRow(_grid2, _grid8, _grid4)),
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
                  Expanded(child: _getGridButton()),
                  Container(width: 20),
                  Expanded(child: _getClearButton()),
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
