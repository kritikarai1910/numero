import 'package:flutter/cupertino.dart';

class StatlessTryClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TryClass();
  }

}
class TryClass extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    //return Text("This is awesome");
    return Container(
      height: 50,
      width: 50,
      child: Text("This is awesome"),
    );
  }

  @override
  State<StatefulWidget> createState() => TryClassState();

}

class TryClassState extends State<TryClass> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}