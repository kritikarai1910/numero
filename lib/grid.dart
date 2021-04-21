import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NumeroGrid extends StatelessWidget {

  var box1, box2, box3;
  NumeroGrid(this.box1,this.box2,this.box3);

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

  @override
  Widget build(BuildContext context) {
    return _buildRow(box1, box2, box3);
  }
}




