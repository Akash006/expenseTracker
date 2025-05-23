import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CategoryForm extends StatefulWidget {
  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  IconData? _pickedIcon;

  void _showIconPicker(BuildContext context) async {
    IconData? icon = await showIconPicker(
      context,
      iconPackModes: [IconPack.fontAwesomeIcons],
    );

    if (icon != null) {
      setState(() {
        _pickedIcon = icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Add Category",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Category Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: _pickedIcon != null
                        ? Icon(_pickedIcon)
                        : Icon(Icons.add),
                    title: Text('Pick Icon'),
                    onTap: () => _showIconPicker(context),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
