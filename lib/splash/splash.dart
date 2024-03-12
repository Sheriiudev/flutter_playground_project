import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground_project/MyHomePage.dart';
import 'package:flutter_playground_project/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashWidget> with TickerProviderStateMixin {
  AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/avatar_man.svg', width: 100, height: 100,),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.white)
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    navigateToHome();
  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  void navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 5000), (() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
        return const MyHomePage(title: "Flutter Demo");
      })));
    }));
  }
}
