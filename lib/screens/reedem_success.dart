import 'package:dimastiui/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SuccessReedem extends StatelessWidget {
  const SuccessReedem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(child:Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: height,
            width: width,
            child:SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/succes_reed.svg", width: 6/10*width,),
                SizedBox(height: 20,),
                Text("Congratulation!", textAlign: TextAlign.center, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 30, color: Color(0xff528DE7)),),
                Text("Reedem Code Have Successfully Applied", textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 15
                ),),
                SizedBox(height: 70,),
              InkWell(
                onTap: (){Get.offAll(HomePage());},
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff528DE7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "GO BACK",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              ],
            )
            )
            ),
            ]
          )
      ));
  }
}