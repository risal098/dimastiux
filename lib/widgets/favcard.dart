import 'package:dimastiui/controllers/songSectionData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/song_ans_page.dart';
import '../widgets/songlevel.dart';
import '../controllers/startSongQuiz.dart';
import '../controllers/songSectionData.dart';
import '../screens/songsection.dart';
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
  Card FavCard(String imageLink, String song, String singer, BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: InkWell(
        onTap: () async{
      showLoadingDialog(context);
      String difficulty = Level.level;
      if(SongSectionData.audioType=="Ielts"){difficulty="ielts"+difficulty;}
     int stats=0; int statscode=await StartSong.getBlobData(difficulty,song,singer,imageLink).timeout(
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
      },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(50), // Image radius
                child: Image(image: (SongSectionData.audioType!="Ielts")?AssetImage(imageLink):AssetImage("assets/images/ieltHome.png"), fit: BoxFit.cover,),
              ),
            ),
            Text(
              song,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(singer, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }