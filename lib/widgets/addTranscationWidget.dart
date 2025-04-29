import 'package:expense_tracker/routes/appRouteConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AddTransactionWidget extends StatefulWidget {
  const AddTransactionWidget({super.key});

  @override
  State<AddTransactionWidget> createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  final FocusNode _focus = FocusNode();
  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _noteText = "No input yet";

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    _focus
      ..removeListener(_onFocusChange)
      ..dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final amount = textController.text;
      context.pop({'amount': amount});
    }
  }

  // Function to show the popup and get user input
  Future<void> _showNoteInputDialog(BuildContext context) async {
    TextEditingController noteController = TextEditingController();

    String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text("Enter Your Name"),
          content: TextField(
            controller: noteController,
            decoration: const InputDecoration(
                hintText: "Notes", hintStyle: TextStyle(color: Colors.grey)),
          ),
          actions: [
            // TextButton(
            //   onPressed: () => Navigator.of(context).pop(), // Close without returning
            //   child: const Text("Cancel"),
            // ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(noteController.text); // Return input value
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _noteText = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 200),
                SizedBox(
                  width: 275,
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.none,
                    focusNode: _focus,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "0",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.white10,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      prefixText: "₹ ",
                      prefixStyle: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    style: TextStyle(
                        fontSize: 24, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    _showNoteInputDialog(context);
                  },
                  child: Text("Notes"),
                ),
                const SizedBox(height: 20),
                // Expanded(child: Container()),
                if (_focus.hasFocus)
                  Flexible(
                    child: NumericKeypad(
                      controller: textController,
                      focusNode: _focus,
                      onSubmit: _submit, // Pass submit function
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmit; // Callback for submitting

  const NumericKeypad({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
  });

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;
  late TextSelection _selection;
  late FocusNode _focusNode;
  bool isOperation = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller..addListener(_onSelectionChanged);
    _selection = _controller.selection;
    _focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    _controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  void _onSelectionChanged() {
    setState(() {
      _selection = _controller.selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildButton('1'),
          _buildButton('2'),
          _buildButton('3'),
          _buildButton('⌫', onPressed: _backspace),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildButton('4'),
          _buildButton('5'),
          _buildButton('6'),
          _buildButton('+/*'),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildButton('7'),
          _buildButton('8'),
          _buildButton('9'),
          _buildButton('-/÷'),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildButton('⇓', onPressed: _hideKeyboard),
          _buildButton('0'),
          _buildButton('.'),
          _buildButton("✔", onPressed: widget.onSubmit), // Submit via checkmark
        ]),
      ],
    );
  }

  void _hideKeyboard() => _focusNode.unfocus();

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: SizedBox(
          height: 60,
          child: TextButton(
            onPressed: onPressed ??
                () {
                  if (text == "-/÷") {
                    _input("-");
                  } else if (text == "+/*") {
                    _input("+");
                  } else {
                    _input(text);
                  }
                },
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue.shade900,
              backgroundColor: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    int position = _selection.base.offset;
    var value = _controller.text;
    if (value.isNotEmpty) {
      var suffix = value.substring(position, value.length);
      value = value.substring(0, position) + text + suffix;
      _controller.text = value;
      _controller.selection =
          TextSelection.fromPosition(TextPosition(offset: position + 1));
    } else {
      _controller.text = text;
      _controller.selection =
          TextSelection.fromPosition(const TextPosition(offset: 1));
    }
  }

  void _backspace() {
    int position = _selection.base.offset;
    final value = _controller.text;
    if (value.isNotEmpty && position != 0) {
      var suffix = value.substring(position, value.length);
      _controller.text = value.substring(0, position - 1) + suffix;
      _controller.selection =
          TextSelection.fromPosition(TextPosition(offset: position - 1));
    }
  }
}
