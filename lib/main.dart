import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:simple_calculator/styled_button.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anjola\'s Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onPressed(String text) {
    setState(() {
      if (text == 'C') {
        _expression = '';
        _result = '';
      } else if (text == '=') {
        try {
          final expression = Expression.parse(_expression);
          const evaluator = ExpressionEvaluator();
          final result = evaluator.eval(expression, {});
          _result = ' = $result';
        } catch (e) {
          _result = ' Error';
        }
      } else {
        _expression += text;
      }
    });
  }

  // Widget _buildButton(String text) {
  //   return Expanded(
  //     child: OutlinedButton(
  //       onPressed: () => _onPressed(text),
  //       child: Text(
  //         text,
  //         style: const TextStyle(fontSize: 24),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Anjola\'s Calculator', style:TextStyle(color: Colors.blue[900],
        fontSize: 40,
        fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.blue[750],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 32),
                  ),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 32, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  StyledButton(
                    onPressed: () => _onPressed('7'),
                    child: const Text('7'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('8'),
                    child: const Text('8'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('9'),
                    child: const Text('9'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('/'),
                    child: const Text('/'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('%'), 
                    child: const Text('%'),
                  )
                ],
              ),
              Row(
                children: [
                  StyledButton(
                    onPressed: () => _onPressed('4'),
                    child: const Text('4'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('5'),
                    child: const Text('5'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('6'),
                    child: const Text('6'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('*'),
                    child: const Text('*'),
                  ),
                ],
              ),
              Row(
                children: [
                  StyledButton(
                    onPressed: () => _onPressed('1'),
                    child: const Text('1'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('2'),
                    child: const Text('2'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('3'),
                    child: const Text('3'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('-'),
                    child: const Text('-'),
                  ),
                ],
              ),
              Row(
                children: [
                  StyledButton(
                    onPressed: () => _onPressed('0'),
                    child: const Text('0'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('C'),
                    child: const Text('C'),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('='),
                    child: const Text('='),
                  ),
                  StyledButton(
                    onPressed: () => _onPressed('+'),
                    child: const Text('+'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}