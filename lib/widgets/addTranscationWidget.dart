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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                width: 275, // Adjust the width as needed
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.none,
                  focusNode: _focus,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "0",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .primaryColor,
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
                    prefixStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24
                    )
                  ),
                  style: TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
              Expanded(child: Container()),
              if (_focus.hasFocus)
                NumericKeypad(
                  controller: textController,
                  focusNode: _focus,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const NumericKeypad(
      {super.key, required this.controller, required this.focusNode});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;
  late TextSelection _selection;
  late FocusNode _focusNode;
  String temp = '';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('+/*')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('-/÷')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('⇓', onPressed: _hideKeyboard),
            _buildButton('0'),
            _buildButton('.'),
            isOperation ? _buildButton("=") : _buildButton("✔"),
          ],
        ),
      ],
    );
  }

  _hideKeyboard() => _focusNode.unfocus();
  bool isUsed = true;

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 4,
          vertical: 4
        ),
        child: SizedBox(
          height: 60,
          child: TextButton(
            // onPressed: _input(text),
            onLongPress: (){
              if(text == "-/÷"){
                _input("/");
              }
              else if(text == "+/*"){
                _input("*");
              }
            },
            onPressed: onPressed ?? (){
              if (text == "-/÷"){
                _input("-");
              }
              else if(text == "+/*"){
                _input("+");
              }
              else if(text == "="){
                _calculate();
              }
              else if(text == "✔"){
                _submit();
              }
              else{
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
      value = _controller.text + text;
      _controller.text = value;
      _controller.selection =
          TextSelection.fromPosition(const TextPosition(offset: 1));
    }
    _toggleCheckAndEqual(value);
  }

  void _toggleCheckAndEqual(String value){
    if(value.contains(RegExp('[+\-/*]'))){
      setState(() {
        isOperation = true;
      });
    }
    else {
      setState(() {
        isOperation = false;
      });
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
    _toggleCheckAndEqual(_controller.text);
  }

  void _calculate(){
    final expression = _controller.text;
    final operatorPattern = RegExp(r'[+\-*/]');

    // Break expression into numbers and operators
    final numbers = expression.split(operatorPattern).map(int.parse).toList();
    final operators = operatorPattern.allMatches(expression).map((m) => m.group(0)!).toList();

    // Apply precedence: first *, / then +, -
    while (operators.contains('*') || operators.contains('/')) {
      for (int i = 0; i < operators.length; i++) {
        if (operators[i] == '*' || operators[i] == '/') {
          final op = operators.removeAt(i);
          final left = numbers.removeAt(i);
          final right = numbers.removeAt(i);
          final result = op == '*' ? left * right : left ~/ right;
          numbers.insert(i, result);
          break; // Restart loop for updated operators
        }
      }
    }

    while (operators.contains('+') || operators.contains('-')) {
      for (int i = 0; i < operators.length; i++) {
        if (operators[i] == '+' || operators[i] == '-') {
          final op = operators.removeAt(i);
          final left = numbers.removeAt(i);
          final right = numbers.removeAt(i);
          final result = op == '+' ? left + right : left - right;
          numbers.insert(i, result);
          break; // Restart loop for updated operators
        }
      }
    }

    // Final result is the only number left
    _controller.text = numbers[0].toString();
    _toggleCheckAndEqual(_controller.text);
  }

  void _submit(){
    final value = _controller.text;
    context.pop(value);
  }
}
