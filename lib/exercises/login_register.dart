import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class LogInRegister extends StatelessWidget {
  const LogInRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? eController = TextEditingController();
    TextEditingController? passController = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: 24.0, top: 110.0, right: 24.0, bottom: 24.0),
      child: Column(
        children: [
          Center(
            child: SvgPicture.asset("assets/images/prime_logo.svg"),
          ),
          Padding(
              padding: EdgeInsets.all(39.0),
              child: Text(
                "Log in to your account using email phone or social networks",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#707070")),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextField(
              controller: eController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0)),
                  filled: true,
                  fillColor: HexColor("#F6F6F6"),
                  hintStyle: TextStyle(color: HexColor("#CDCDCD")),
                  hintText: "Email or phone",
                  prefixIcon: Icon(Icons.person_2_outlined,
                      color: HexColor("#CDCDCD"))),
            ),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0)),
                filled: true,
                fillColor: HexColor("#F6F6F6"),
                hintStyle: TextStyle(color: HexColor("#CDCDCD")),
                hintText: "Password",
                prefixIcon:
                    Icon(Icons.lock_outline, color: HexColor("#CDCDCD"))),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forget Password?",
                style: TextStyle(color: HexColor("#4361D7")),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
