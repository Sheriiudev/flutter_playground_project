import 'package:flutter/material.dart';
import 'package:flutter_playground_project/main.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState()

}

class SplashState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.white,
                ),
              ),
              Image(image: )
            ],
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 2000), (() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
        return const MyApp();
      })));
    }));
  }
}