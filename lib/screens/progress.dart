import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/achiement.dart';
import '../widgets/chart.dart';
import '../widgets/target.dart';

class ProgressPage extends StatelessWidget {
  String pageName = "ProgressPage";
  ProgressPage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xff15CAD7),
                    Color(0xffE8E8E8),
                    Color(0xffE8E8E8)
                  ]),
            ),
            child: Padding(
              padding: (height > 850)
                  ? EdgeInsets.only(
                      top: 0.04 * height,
                      left: 0.05 * width,
                      right: 0.05 * width)
                  : EdgeInsets.only(
                      top: 0.03 * height,
                      left: 0.072 * width,
                      right: 0.072 * width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: <Widget>[
                      IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon:
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "My Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 35 / 800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "WEEKLY TARGET",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff528DE7)),
                          child: const Text(
                            "Set Target",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TargetCard(),
                  SizedBox(
                    height: height * 22 / 800,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Played Audio",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: UserChart(),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 20 / 800,
                  ),
                  const Text(
                    "Achievement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height * 10 / 800,
                  ),
                  AchievementCard(height: height, width: width)
                ],
              ),
            ),
          ),
        ),
      ),/*
      bottomNavigationBar: Container(
        width: width,
        height: height * (56 / 800),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, -4),
              blurRadius: 4),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/home.svg",
              width: 44,
              height: 44,
            ),
            SizedBox(width: 0.2 * width),
            SvgPicture.asset(
              "assets/icons/trophy.svg",
              width: 41,
              height: 41,
              colorFilter:
                  const ColorFilter.mode(Color(0xff528DE7), BlendMode.srcIn),
            ),
            SizedBox(width: 0.2 * width),
            SvgPicture.asset("assets/icons/ui-user-profile.svg"),
          ],
        ),
      ),*/
    );
  }
}
