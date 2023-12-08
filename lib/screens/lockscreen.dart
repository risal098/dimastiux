import 'package:dimastiui/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color(0xff0fd3d5),
              Color(0xff20bcda),
              Color(0xff32a6df),
              Color(0xff4292e3),
              Color(0xff527ee7),
            ])),
        child: Stack(children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Image.asset("assets/images/logomark.png"),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "GET FULL ACCESS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4.5,
                    height: 1.5),
              ),
              const Text(
                "TO TOBA APP\nAND BICARA AI\nBY A SINGLE PAYMENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 4.5,
                    height: 1.6),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    benefits("Get access to Progress Feature"),
                    SizedBox(
                      height: 10,
                    ),
                    benefits("Unlimited access to play song and dialogue"),
                    SizedBox(
                      height: 10,
                    ),
                    benefits("Get feedback after playing song or dialogue"),
                    SizedBox(
                      height: 10,
                    ),
                    benefits("Play with various difficulity levels")
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff527ee7),
                  ),
                  child: Text(
                    "BUY VIP",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Row benefits(String sentence) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/check-fill.svg",
          width: 35,
        ),
        SizedBox(
          width: 300,
          child: Text(
            sentence,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
