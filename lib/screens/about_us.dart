import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final List title = ["Feature Introduction", "Our Goal", "Our Team"];
    final List content = ["Our main features are 'Guess the Lyrics' and 'Guess the Dialogue.' Users have to transcribe what they hear and will be given a score after answering all questions as feedback. In addition, we provide other features such as 'Leaderboard' and 'My Progress' to motivate users in learning English on Scriby. We also offer different difficulty levels for 'Guess the Song' and 'Guess the Dialogue'.", "Our goal is to make learning English fun and accessible. On our platform, you can learn through songs conversations such as dialogue or monologue. We want to create a user-friendly space where you can customize your learning journey and connect with others.",
    "Scriby is developed by three students from Universitas Negeri Jakarta, all majoring in Computer Science. Two of us specialize in backend development, and one in frontend development. We are currently in our 3rd semester."];
    final List images = ["assets/images/about_us/features.svg", "assets/images/about_us/connect.svg", "assets/images/about_us/teams.svg"];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ABOUT US", textAlign: TextAlign.center, style: TextStyle(color: const Color(0xff528DE7), fontSize: (width<800)?30:40, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
              SizedBox(height: 70,),
              (width<800)
              ? phone(width, title[0], content[0], images[0])
              : desktop1(width, title[0], content[0], images[0]),
              SizedBox(height: 100,),
              (width<800)
              ? phone(width, title[1], content[1], images[1])
              : desktop2(width, title[1], content[1], images[1]),
              SizedBox(height: 100,),
              (width<800)
              ? phone(width, title[2], content[2], images[2])
              : desktop1(width, title[2], content[2], images[2]),
              SizedBox(height: 100,),
               Container(
                height: 1,
                width: width,
                color: Colors.black,
              ),
              SizedBox(height: 50,),
              Text("CONTACT US", textAlign: TextAlign.center, style: TextStyle(color: const Color(0xff528DE7), fontSize: (width<800)?25:30, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_rounded),
                  SizedBox(width: 10,),
                  Text("risalahqolbu859@gmail.com", style: TextStyle(fontSize: 15, fontFamily: "Poppins"),)
                ],
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
      Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.close_rounded)),
            ))
        ],
      )
    ),
    );
  }
  Column phone(double width, String title, String content, String image){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(image, width: (width>500)?width/2:width/3*2,),
        SizedBox(height: 15,),
        Text(title, textAlign: TextAlign.center, style: TextStyle(color: const Color(0xff528DE7), fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
        SizedBox(height: 10,),
        SizedBox(
          width: width,
          child: Text(content, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: "Poppins"),),
        )
      ],
    );
  }

  Row desktop1(double width, String title, String content, String image) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: const Color(0xff528DE7), fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
                    SizedBox(
                      width: width/2,
                      child: Text(content, style: TextStyle(fontSize: 20, fontFamily: "Poppins"),),
                    )
                  ],
                ),
                SizedBox(width: 20,),
                SvgPicture.asset(image, width: width/4,)

              ],
            );
  }
  Row desktop2(double width, String title, String content, String image) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(image, width: width/4,),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: const Color(0xff528DE7), fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
                    SizedBox(
                      width: width/2,
                      child: Text(content, style: TextStyle(fontSize: 20, fontFamily: "Poppins"),),
                    )
                  ],
                ),

              ],
            );
  }
}