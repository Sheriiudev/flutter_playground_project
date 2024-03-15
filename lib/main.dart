import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground_project/color_schemes.dart';
import 'package:flutter_playground_project/splash/splash.dart';
import 'package:flutter_playground_project/webview/MyWebViewWidget.dart';

Future<void> main() async{
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme
      ),
      home: const MyWebViewWidget(),
    );
  }
}


