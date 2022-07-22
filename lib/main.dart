import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((val) {
    runApp(BMICalculator());
  });
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Using alredy defined theme with small chages by copyWith
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

// Creating custom theme using ThemeData
// theme: ThemeData(
//     primaryColor: Color(0xFF0A0E21), // alpha (background opacity) and hexcode without #
//     accentColor: Colors.purple,
//     scaffoldBackgroundColor: Color(0xFF0A0E21),
//     textTheme: TextTheme(
//       bodyText2: TextStyle(
//         color: Colors.white,
//       ),
//     )),

// Creating custom theme for each widget using Theme
// floatingActionButton: Theme(
//   data: ThemeData(
//     accentColor: Colors.purple,
//   ),
//   child: FloatingActionButton(
//     child: Icon(Icons.add),
//     onPressed: null,
//   ),
// ),
