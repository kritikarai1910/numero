import 'package:flutter/material.dart';

Widget _buildFirstRow(String _grid3, String _grid1, String _grid9) {
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