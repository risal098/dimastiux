import 'package:dimastiui/screens/persuasive_ad.dart';

import '../screens/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import "./accountPage.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../controllers/songPoint.dart';
import '../controllers/startSongQuiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/accountData.dart';
import '../controllers/songSectionData.dart';
import '../widgets/songlevel.dart';
import '../database/leaderboardDB.dart';
class SongGrade extends StatefulWidget{
  SongGrade({super.key});

  @override
  _SongGrade createState() => _SongGrade();
}

class _SongGrade extends State<SongGrade>{
String pageName = "SongGrade";
MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);
int option=0;

Widget wrapper(int options){
//  print("tes");
if(options==0){
  return InkWell(
    onTap: (){setState((){this.option=1;});},
    child:Container(
    
    width: 197,padding: EdgeInsets.all(3),
    height: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.blue,
      
    ),
    child: Row(children: [
      Container(
        padding: EdgeInsets.all(8),
        width: 90,
        child: AutoSizeText("My Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.blue)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
        ),
      ),
      Container(
        padding: EdgeInsets.all(5),
        width:98,
        child: AutoSizeText("Right Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.white),)
      )
    ],
    ),
  ));
}
else{
  return InkWell(
    onTap: (){setState((){this.option=0;});}
    ,child: Container(
    
    width: 197,padding: EdgeInsets.all(3),
    height: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.blue,
      
    ),
    child: Row(children: [
      Container(
        padding: EdgeInsets.all(8),
        width: 90,
        child: AutoSizeText("My Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.white))
      ),
      Container(
        padding: EdgeInsets.all(5),
        width:98,
        child: AutoSizeText("Right Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.blue),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
        ),
      )
    ],
    ),
  ));
}
}
void finish()async{
  if(AccountData.sendingScoreState==0){
    AccountData.sendingScoreState=1;
    int tempPoints=100;
    if(Level.level=="Easy"){tempPoints=100;}
    else if(Level.level=="Medium"){tempPoints=200;}
    else{tempPoints=300;}
    PointData. points=(PointData.percentage!*tempPoints).toInt()-PointData.replays*2;
    AccountData.points=AccountData.points!+PointData. points;
    LeaderboardDB.points[0]+=PointData. points;
     AccountData.totalReplay=AccountData.totalReplay!+PointData. replays;
     AccountData.weeklyProgress=AccountData.weeklyProgress!+1;
      AccountData.weeklyProgresPercentage=((AccountData.weeklyProgress!/AccountData.weeklyTarget!)*100).toInt();
      AccountData.weeklyStat!["Saturday"]=AccountData.weeklyStat!["Saturday"]+1;
    print(PointData. points);
    print(tempPoints);
    print(PointData.replays);
    print("jadi kan");
    List<int> data=[AccountData.userId!,PointData. points,PointData.replays];
    if(SongSectionData.audioType!="Ielts")
    {
   
                  PointData.replays=0;
                 PointData. points=0;
                  AccountData.sendingScoreState=0;
                  AccountData.state=1;
                  print("hu${AccountData.state}");
              //   await  AccountData.getData();
                 AccountData.playedAudioToday+=1;
  Get.offAll(HomePage());
  }else{
   
                  PointData.replays=0;
                  PointData.points=0;
                   AccountData.sendingScoreState=0;
                    AccountData.state=1;
                    print("aw ${AccountData.state}");
               //     await  AccountData.getData();
                     AccountData.playedAudioToday+=1;
  if (AccountData.playedAudioToday%3==0 && AccountData.permissionStatus!=1){
    Navigator.push(context, MaterialPageRoute(builder: (context){return PersuasiveAd();}));
  }
  else{
    Get.offAll(HomePage());
  }
  }
    
  }
  
}

double progres=PointData.percentage!;
String result="Great Job!";

@override
Widget build(BuildContext context){
  print("rebuild");
  return  SafeArea(
      child: Scaffold(
        body:Row(
          children: [
             Container(
              width: mediaQueryData.size.width/11,
              color: Colors.white,
             )
             ,Expanded(child:Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: SingleChildScrollView(child: 
              Column(children:  //makanan utama
              [
                SizedBox(
              
              height: 30,
             ),
             SizedBox(
              height: 20,
             )
    ,Container(
          width: mediaQueryData.size.width*9/11,
          decoration: BoxDecoration(
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              height: 20,
             ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 8.0,
                percent: progres, // Adjust the percentage as needed
                center:
                 Text("${(progres*100).round()}%",style: TextStyle(fontSize: 40,fontFamily: 
                "Poppins",fontWeight: FontWeight.w600,color: Color(0xFF527EE7)),),

                progressColor: Color(0xFF527EE7),
              ),SizedBox(
              
              height: 10,
             ),AutoSizeText(
            textAlign:TextAlign.left,
              "${result}",
              style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 35),
              maxLines: 2,
            ),
              SizedBox(
              
              height: 10,
             ),Container(
              width: mediaQueryData.size.width*9/11,
              alignment: Alignment.centerLeft,
              child:wrapper(this.option)),
              
              SizedBox(
              height: 24,
              
             ),Container( //tempat jawaban user
              padding: EdgeInsets.all(8),
  width: mediaQueryData.size.width*9/11, // Set your desired width
  height: 200, // Set your desired height
  decoration: BoxDecoration(
    border: Border.all(color: Colors.blue),
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    children: [
      Expanded(
        child: chooseAnswer()
      ),
    ],
  ),
)
            ],
          ),
        ),
              
              SizedBox(
              
              height: 10,
             ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF527EE7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    minimumSize: Size(mediaQueryData.size.width*9/11 , 46), // Set the width and height as needed
  ),
                onPressed: () {
                  
                  finish();
                  
                  },
                child: Text("Finish Review",style: TextStyle(color: Colors.white),),
              )]/*utama*/
              ,)
              ),
             ))
             ,Container(
              width: mediaQueryData.size.width/11,
              color: Colors.white,
             )
          ],
        )
      )
      );
}
Color chooseByPoint(double? based){
  if(based! >=0.8){
    return Colors.green;
  }else if(based! <0.8 && based! >=0.4){
    return Colors.orange;
  }
  else if(based < 0.4 && based! >= 0.1){
    return Colors.red;
  }else{
    return Color.fromARGB(255, 31, 4, 2);
  }
}

Widget userAnswer(){
  return ListView(
          children: [
            Text("ANSWER 1"),
            AutoSizeText
            (StartSong.userLyric1!,style:TextStyle(color:chooseByPoint(PointData.answerPoint1))
            ,maxLines:6),
            Text("ANSWER 2"),
            AutoSizeText
            (StartSong.userLyric2!,style:TextStyle(color:chooseByPoint(PointData.answerPoint2))
            ,maxLines:6),
            Text("ANSWER 3"),
            AutoSizeText
            (StartSong.userLyric3!,style:TextStyle(color:chooseByPoint(PointData.answerPoint3))
            ,maxLines:6),
            
            // Add more content as needed
          ],
        );
}
Widget rightAnswer(){
  return ListView(
          children: [
            Text("ANSWER 1"),
            AutoSizeText(StartSong.lyric1!,style:TextStyle(color:Colors.black)
            ,maxLines:6),// Add your content here, such as other containers and images
            Text("ANSWER 2"),
            AutoSizeText(StartSong.lyric2!,style:TextStyle(color:Colors.black)
            ,maxLines:6),
            Text("ANSWER 3"),
            AutoSizeText(StartSong.lyric3!,style:TextStyle(color:Colors.black)
            ,maxLines:6),
            
            // Add more content as needed
          ],
        );
}
Widget chooseAnswer(){
  if(this.option==0){return userAnswer() ; }
  else{return rightAnswer(); }
 
}
}
