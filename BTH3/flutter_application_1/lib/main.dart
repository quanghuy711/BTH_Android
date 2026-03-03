import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

const studentName = 'Nguyễn Quang Huy';
const studentId = '2251061797';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick More Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(studentName: studentName, studentId: studentId),
    );
  }
}
