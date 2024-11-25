import 'package:flutter/material.dart';

class Addtranscations extends StatelessWidget {

  final String type;
  final String category;

  const Addtranscations({super.key, required this.type, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add $type"),
      ),
      body: Center(
        child: Text("$type -> $category"),
      ),
    );
  }
}
