import 'package:expense_tracker/modals/expenseModal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:expense_tracker/routes/appRouteConfig.dart';

class addTranscationForm extends StatefulWidget {
  final String category;
  final String expenseType;

  const addTranscationForm({
    super.key,
    required this.category,
    required this.expenseType,
  });

  @override
  State<addTranscationForm> createState() => _addTranscationFormState();
}

class _addTranscationFormState extends State<addTranscationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  // Form input
  DateTime? transcationDate;
  int? Amount;
  String? Note;

  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String strDate = transcationDate != null
          ? DateFormat('dd-MM-yyyy').format(transcationDate!)
          : 'No date selected';

      print("${widget.expenseType} -> ${widget.category} -> "
          "${Amount ?? 'N/A'} -> ${Note ?? 'N/A'} -> $strDate");

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add ${widget.expenseType}",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.grey,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                    label: Text("Select Date"),
                    suffixIcon: Icon(Icons.calendar_today)),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2050),
                      initialDate: DateTime.now());
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate;
                    });
                  }
                },
                validator: (value){
                  if (_dateController.text.isEmpty){
                    return "Please enter valid date";
                  }
                },
                onSaved: (value) {
                  if (_dateController.text.isNotEmpty) {
                    transcationDate =
                        DateFormat('dd-MM-yyyy').parse(_dateController.text);
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Amount';
                  }

                  int? number = int.tryParse(value);
                  if (number == null || number < 0) {
                    return "Please enter correct amount";
                  }
                  return null;
                },
                onSaved: (value) {
                  Amount = int.tryParse(value!) ?? 0;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: Text("Note"),
                    suffixIcon: Icon(Icons.event_note_outlined)),
                onSaved: (value) {
                  Note = value ?? "";
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text("Submit"),
              )
            ],
          ),
        )));
  }
}
