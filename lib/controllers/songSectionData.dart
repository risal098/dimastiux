import 'dart:convert';

import 'package:http/http.dart' as http;
import '../database/songListDB.dart';


//SongSectionData.audioType
class SongSectionData{
   static String? audioType;
  static  List<String>? titles;
  static  List<String>? singer;
  static  List<String>? imageLink;
  static List<String>? getTitle;
  static bool fillBasicSongListStatus=false;
  static void makeNull1(){
    SongSectionData.titles = null;
    SongSectionData.singer = null;
    SongSectionData.imageLink = null;
    SongSectionData.getTitle = null;
    SongSectionData.fillBasicSongListStatus = false;
  }
  static  List<String>? titles2;
  static  List<String>? singer2;
  static  List<String>? imageLink2;
  static List<String>? getTitle2; 
  static bool fillFavSongListStatus=false;
  static void makeNull2(){
    SongSectionData.titles2 = null;
    SongSectionData.singer2 = null;
    SongSectionData.imageLink2 = null;
    SongSectionData.getTitle2 = null;
    SongSectionData.fillFavSongListStatus = false;
  } 
  static void itemPrepare1(){
    SongSectionData.titles = [];
    SongSectionData.singer = [];
    SongSectionData.imageLink = [];
    SongSectionData.getTitle = [];
  }
  static void itemPrepare2(){
    SongSectionData.titles2 = [];
    SongSectionData.singer2 = [];
    SongSectionData.imageLink2 = [];
    SongSectionData.getTitle2 = [];
  }
  static Future<int> storeApi() async{
    /*
    

    [
      [
        title,
        singer,
        imagelink
      ]
      ,
      [
        title,
        singer,
        imagelink
      ]
    ]
    */
    audioType="Song";
    /*
      var response=await http.get(Uri.https("bicaraai12.risalahqz.repl.co"
                                        ,"getBasicSongList")).timeout(
                                          const Duration(seconds: 13),
                      onTimeout: (){

                                          return http.Response("nope", 500);});
      List<dynamic> listBody=jsonDecode(response.body);
      */
     itemPrepare1();
    for(int i=0;i<SongListDB.songList.length;i++){
      List<dynamic> tempList=SongListDB.songList[i];
      
         SongSectionData.titles?.add(tempList[0]);
      SongSectionData. singer?.add(tempList[1]);
       SongSectionData.imageLink?.add(tempList[2]);
       SongSectionData.getTitle?.add(tempList[3]);
      
    }
     SongSectionData.fillBasicSongListStatus=true;
    print("lets go 5 ");
    //print(response.statusCode);
    return 200;
  }
  static Future<int> storeApiIelts() async{
    /*
    

    [
      [
        title,
        singer,
        imagelink
      ]
      ,
      [
        title,
        singer,
        imagelink
      ]
    ]
    */
   SongSectionData.audioType="Ielts";
   /*
      var response=await http.get(Uri.https("bicaraai12.risalahqz.repl.co"
                                        ,"getBasicIeltsList")).timeout(
                                          const Duration(seconds: 13),
                      onTimeout: (){

                                          return http.Response("nope", 500);});
      List<dynamic> listBody=jsonDecode(response.body);
      */
     itemPrepare1();
    for(int i=0;i<SongListDB.ieltsList.length;i++){
      List<dynamic> tempList=SongListDB.ieltsList[i];
      
         SongSectionData.titles?.add(tempList[0]);
      SongSectionData. singer?.add(tempList[1]);
       SongSectionData.imageLink?.add(tempList[2]);
       SongSectionData.getTitle?.add(tempList[3]);
      
    }
     SongSectionData.fillBasicSongListStatus=true;
    print("lets go 5 ");
    return 200;
  }





}