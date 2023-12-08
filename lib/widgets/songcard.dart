import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/song_ans_page.dart';
import '../widgets/songlevel.dart';
import '../controllers/startSongQuiz.dart';
import '../controllers/songSectionData.dart';
import '../screens/songsection.dart';
Widget SongCard(String imageLink, String songName, String singer,String getTitle, BuildContext context) {
    void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }
  return InkWell(
    onTap: () async{
      showLoadingDialog(context);
      String difficulty = Level.level;
      if(SongSectionData.audioType=="Ielts"){difficulty="ielts"+difficulty;}
     int stats=0; int statscode=await StartSong.getBlobData(getTitle,difficulty,songName,singer,imageLink).timeout(
                                          const Duration(seconds: 29),
                      onTimeout: (){

                                          return stats=-1;});
        if(stats==-1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongSection();}));
        }
      else{Navigator.pop(context);
      Get.off(()=>SongAns());}
      if(statscode==-1){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongSection();}));
      }
      }
      ,child:
  Card(
    elevation: 5,
    margin: EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (SongSectionData.audioType!="Ielts")?
            CircleAvatar(
              radius: 25,
              backgroundImage:  AssetImage(imageLink)
          
            ):CircleAvatar(
              radius: 25,
              backgroundImage:  AssetImage("assets/images/ieltHome.png")
          
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songName,
                  style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(singer),
              ],
            )
          ],
        ),
        
        Container(
        //  onTap: () {Get.off(SongAns());},
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 40,
          ),
        )
      ]),
    ),
  ));
}
