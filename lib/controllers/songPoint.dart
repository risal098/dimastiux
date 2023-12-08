import 'dart:typed_data';
import 'startSongQuiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PointData{
  static double? percentage;
  static int? overallPoint;
  static double? answerPoint1;
  static double? answerPoint2;
  static double? answerPoint3;
  static int replays=0;
  static int points=0;
  static void makeNull(){
    PointData.percentage=null;
    PointData.overallPoint=null;
    PointData.answerPoint1=null;
    PointData.answerPoint2=null;
    PointData.answerPoint3=null;
  }

  static Future<void> getPoints() async{
    var url = Uri.https('bicaraai12.risalahqz.repl.co', 'getComparisonAnswerPoint');
    var response = await http.post(url, body: jsonEncode
                               ([[StartSong.lyric1!
                                  ,StartSong.lyric2!
                                  ,StartSong.lyric3!
                                 ],
                                 [StartSong.userLyric1!
                                  ,StartSong.userLyric2!
                                  ,StartSong.userLyric3!
                                 ]]
                               )
                              );
    var data=jsonDecode(response.body);
    PointData.answerPoint1=data[0];
    PointData.answerPoint2=data[1];
    PointData.answerPoint3=data[2];
    PointData.percentage=(data[0]+data[1]+data[2])/3;
    
  }
  


}