import 'package:flutter/material.dart';
import 'package:sample_api/core/routes/router.dart';
import 'package:sample_api/screens/screen_home.dart';
import 'package:sample_api/screens/screen_questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        routeHome: (context) => const ScreenHome(),
        routeQuestions: (context) => const ScreenQuestions(),
      },
    );
  }
}
