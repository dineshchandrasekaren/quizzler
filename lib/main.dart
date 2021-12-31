import 'package:flutter/material.dart';
import 'package:quizzler/quiz_page.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}


// void Alert() {
//   showDialog<String>(
//     context: context,
//     builder: (BuildContext context) => AlertDialog(
//       backgroundColor: Colors.grey[800],
//       title: Icon(icon),
//       content: Text(
//         'Done',
//         textAlign: TextAlign.center,
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
