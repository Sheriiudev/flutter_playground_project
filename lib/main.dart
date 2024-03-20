import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground_project/color_schemes.dart';
import 'package:flutter_playground_project/exercises/login_register.dart';
import 'package:flutter_playground_project/splash/splash.dart';

Future<void> main() async{
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme
      ),
      home: const LogInRegister(),
    );
  }
}


