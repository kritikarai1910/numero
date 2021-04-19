import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridButtons extends StatefulWidget {
  int _value = 50;

  // Widget _getYearDropdown() {
  //   return DropdownButton(
  //       value: _value,
  //       items: getItems(),
  //       onChanged: (int? value) {
  //         setState(() {
  //           _value = value!;
  //         });
  //       });
  // }

  // List<DropdownMenuItem<int>> getItems() {
  //   String year = "19";
  //   List<DropdownMenuItem<int>> items = [];
  //
  //   for (int i = 50; i < 100; i++)
  //     items.add(DropdownMenuItem(
  //       child: Text(year + i.toString()),
  //       value: i,
  //     ));
  //
  //   year = "200";
  //
  //   for (int i = 0; i < 10; i++)
  //     items.add(DropdownMenuItem(
  //       child: Text(year + i.toString()),
  //       value: i,
  //     ));
  //
  //   year = "20";
  //
  //   for (int i = 10; i < 50; i++)
  //     items.add(DropdownMenuItem(
  //       child: Text(year + i.toString()),
  //       value: i,
  //     ));
  //   return items;
  // }

  @override
  _GridButtonState createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButtons> {
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
            SizedBox(
              width: 100,
            height: 100,
            //child: _getYearDropdown()
          child: DropdownButton(
                value: _value,
                items: getItems(),
                onChanged: (int? value) {
                  setState(() {
                    _value = value!;
                  });
                })));
  }
}
