import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class NumeroDatePicker extends StatefulWidget {
  final myController;

  NumeroDatePicker(this.myController);

  @override
  _NumeroDatePickerState createState() => _NumeroDatePickerState(myController);
}

class _NumeroDatePickerState extends State<NumeroDatePicker> {
  final myController;

  _NumeroDatePickerState(this.myController);

  //final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: DateTimeField(
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
    ));
  }
}
