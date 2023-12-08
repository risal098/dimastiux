

import 'package:dimastiui/controllers/accountData.dart';
import 'package:dimastiui/widgets/card_info.dart';
import 'package:flutter/material.dart';

class Level{
  static String level = "Easy";
}

class StateSongLevel extends StatefulWidget {
  const StateSongLevel({super.key});


  @override
  State<StateSongLevel> createState() => _StateSongLevelState();
}

class _StateSongLevelState extends State<StateSongLevel> {
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return FeatureInfo(title: "Difficulity Options", desc: "Improve your skills across different difficulty levels.\n\nExclusive for VIP users!", image: "assets/images/cardInfo_image.svg");
      },
    );
  }

  bool status1 = true;
  bool status2 = false;
  bool status3 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Row(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              if(status1 != true){
                  Level.level = "Easy";
                  status1 = true;
                  status2 = false;
                  status3 = false;
              }
            });
          },
          child: LevelBox(height, width, status1, "Easy"),
        ),
        
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            (AccountData.permissionStatus!=1)
            ? showLoadingDialog(context)
            :setState(() {
                if(status2!=true){
                  Level.level = "Medium";
                  status1 = false;
                  status2 = true;
                  status3 = false;
              }
            });
          },
          child: LevelBox(height, width, status2, "Medium"),
        ),
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            (AccountData.permissionStatus!=1)
            ? showLoadingDialog(context)
            : setState(() {
              if(status3!=true){
                  Level.level = "Hard";
                  status1 = false;
                  status2 = false;
                  status3 = true;
              }
            });
          },
          child: LevelBox(height, width, status3, "Hard"),
        ),
        

      ],
    );
  }

  SizedBox LevelBox(double height, double width, bool status, String name) {
    return SizedBox(
        height: height * 30 / 800,
        width: width * 70 / 360,
        child: (AccountData.permissionStatus!=1 && name != "Easy")
        ? Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: levelboxContainer(status, name, height, width),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.lock_rounded, size: 20, color: Color.fromARGB(255, 0, 0, 0),)
            )
          ],
        )
        : Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: levelboxContainer(status, name, height, width),
            )
          ],
        ),
      );
  }

  Container levelboxContainer(bool status, String name, var height, var width) {
    return Container(
        height: height * 25 / 800,
        width: width * 65 / 360,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (status == true)?const Color(0xff528DE7):const Color(0xff528DE7).withOpacity(0.7),
            borderRadius: BorderRadius.circular(40)),
        child: Text(
          name,
          style: TextStyle(
            color: (status == true)?Colors.white:Colors.black,
            fontWeight: (status == true)?FontWeight.bold:FontWeight.normal,
          ),
        ),
      );
  }
  }
