import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumeroYearDropdown extends StatefulWidget {

  @override
  _NumeroYearDropdownState createState() => _NumeroYearDropdownState();
}

class _NumeroYearDropdownState extends State<NumeroYearDropdown> {
  int _value = 50;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            DropdownButton(
                value: _value,
                items: getItems(),
                onChanged: (int? value) {
                  setState(() {
                    _value = value!;
                  });
                }));
  }
}
