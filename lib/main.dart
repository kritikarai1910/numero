import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'basic_number.dart';
import 'numero_year_dropdown.dart';
import 'numero_date_picker.dart';
import 'grid.dart';
import 'grid_values.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var _gridList = List<String>.filled(10, '');

  String text = "";

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
      GridValues.setGridValues(_gridList);
      debugPrint('$_gridList');
    });
  }

  void _clearFields() {
    setState(() {
      myController.clear();
      GridValues.clearGridValues();
      _gridList = List<String>.filled(10, '');
    });
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
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
              Expanded(child: Container(
                height: 50,
                  child: NumeroDatePicker(myController)
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
              Container(
                child: Icon(Icons.timeline),
              ),
              Container(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  //width: 2000,
                  child: NumeroYearDropdown(),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 50,
                    color: Colors.blue,
                  )
                ],
              )
            ],
          ),
          Expanded(
           child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Column(children: [
                      Expanded(child: NumeroGrid(GridValues.grid3,GridValues.grid1, GridValues.grid9)),
                      Expanded(child: NumeroGrid(GridValues.grid6, GridValues.grid7, GridValues.grid5)),
                      Expanded(child: NumeroGrid(GridValues.grid2, GridValues.grid8, GridValues.grid4)),
                    ]),
                  ),
                )


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
                  ),
                ],
              ),
              Row(
                children: [
                  Text("")
                ],
              ),
              Row(
                children: [
                  Text("")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
