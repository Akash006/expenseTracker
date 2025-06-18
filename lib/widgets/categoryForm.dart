import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../database/createDatabase.dart';

class CategoryForm extends StatefulWidget {
  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  IconData? _pickedIcon;
  final TextEditingController _categoryController = TextEditingController();
  String? _newCategoryName;
  int? _categoryIconName;
  String? _categoryIconFamily;

  DBHelper? _myDB;

  void _showIconPicker(BuildContext context) async {
    IconData? icon = await showIconPicker(
      context,
      iconPackModes: [IconPack.material],
    );

    void dispose() {
      super.dispose();
      _categoryController.dispose();
    }

    if (icon != null) {
      setState(() {
        _pickedIcon = icon;
      });
    }
  }

  void initState() {
    super.initState();
    _myDB = DBHelper.getInstance;
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_categoryController.text != null) {
        print("Category Name: ${_categoryController.text}");
        _newCategoryName = _categoryController.text;
      }

      if (_categoryController.text != null) {
        print("Icon Name: ${_pickedIcon?.codePoint}");
        _categoryIconName = _pickedIcon?.codePoint;
        print("Icon family: ${_pickedIcon?.fontFamily}");
        _categoryIconFamily = _pickedIcon?.fontFamily;
      }

      bool? insertResult = await _myDB?.insertCategoryDB(
        categoryName: _newCategoryName,
        categoryIconName: _categoryIconName?.toInt(),
        categoryFamily: _categoryIconFamily,
      );

      Navigator.of(context).pop();
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
                textInputAction: TextInputAction.next,
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: "Category Name",
                  hintText: "Enter Category Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                validator: (value) {
                  if (_categoryController.text.isEmpty) {
                    return "Please enter category name";
                  }
                },
                onSaved: (value) {
                  if (_categoryController.text.isEmpty) {
                    _newCategoryName = _categoryController.text;
                  }
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListTile(
                      trailing: _pickedIcon != null
                          ? Icon(_pickedIcon)
                          : Icon(Icons.add),
                      title: Text(
                        'Pick Icon',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      onTap: () => _showIconPicker(context),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Add'),
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
