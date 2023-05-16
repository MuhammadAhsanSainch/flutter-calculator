import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 100,
                        width: 250.0,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Bobbers',
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('Developed By...'),
                              TyperAnimatedText(
                                  'Dr. Muhammad Ahsan Sainch...,'),
                              TyperAnimatedText(
                                  'Learning never comes to an end'),
                              TyperAnimatedText('- Dr. Sainch'),
                            ],
                            // onTap: () {
                            //   print("Tap Event");
                            // },
                          ),
                        ),
                      ),
                    ),
                    Text(
                      userInput.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      title: 'AC',
                      onPress: () {
                        userInput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+/-',
                      onPress: () {
                        // userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'DEL',
                      onPress: () {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '/',
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '9',
                      onPress: () {
                        userInput += '9';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'x',
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '-',
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+',
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '%',
                      onPress: () {
                        // userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '.',
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '=',
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluation.toString();
  }
}
