import 'package:flutter/material.dart';

class AddTranscationWidget extends StatefulWidget {
  const AddTranscationWidget({super.key});

  @override
  State<AddTranscationWidget> createState() => _AddTranscationWidgetState();
}

class _AddTranscationWidgetState extends State<AddTranscationWidget> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.none,
                  focusNode: _focus,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "0",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 1.5,
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
                    prefixText: "\$ ",
                  ),
                ),
              ),
              const Spacer(),
              _focus.hasFocus
                  ? NumericKeypad(
                controller: textController,
                focusNode: _focus,
              )
                  : Container(),
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
            _buildButton('-/D')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('⇓', onPressed: _hideKeyboard),
            _buildButton('0'),
            _buildButton('.'),
            _buildButton('T'),
          ],
        ),
      ],
    );
  }

  _hideKeyboard() => _focusNode.unfocus();

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 4,
          vertical: 2
        ),
        child: TextButton(
          onPressed: onPressed ?? () => _input(text),
          child: Text(text),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
