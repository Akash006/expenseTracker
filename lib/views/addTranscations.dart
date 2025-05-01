import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/addTranscationWidget.dart';

class Addtranscations extends StatelessWidget {

  final String type;
  final String category;

  const Addtranscations({super.key, required this.type, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add $type"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            )
        ),
      ),
      body: AddTransactionWidget(),
    );
  }
}
