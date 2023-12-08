import 'package:just_audio/just_audio.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../database/audioDB.dart';
import '../controllers/songSectionData.dart';
class MyJABytesSource extends StreamAudioSource {
  final Uint8List? _buffer;

  MyJABytesSource(this._buffer) : super(tag: 'MyAudioSource');

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    // Returning the stream audio response with the parameters
    return StreamAudioResponse(
      sourceLength: _buffer!.length,
      contentLength: (end ?? _buffer!.length) - (start ?? 0),
      offset: start ?? 0,
      stream: Stream.fromIterable([_buffer!.sublist(start ?? 0, end)]),
      contentType: 'audio/wav',
    );
  }
}


class StartSong{
  
  static String? title;
  static String? singer;
  static String? imageLink;
  static Uint8List? forPlayer1;
  static Uint8List? forPlayer2;
  static Uint8List? forPlayer3;
  static AudioPlayer? player1;
  static AudioPlayer? player2;
  static AudioPlayer? player3;
  static String? lyric1;
  static String? lyric2;
  static String? lyric3;
  static String? userLyric1;
  static String? userLyric2;
  static String? userLyric3;
  static void makeNull(){
    StartSong.title=null;
    StartSong.singer=null;
    StartSong.imageLink=null;
    StartSong.forPlayer1=null;
    StartSong.forPlayer2=null;
    StartSong.forPlayer3=null;
    StartSong.player1=null;
    StartSong.player2=null;
    StartSong.player3=null;
    StartSong.lyric1=null;
    StartSong.lyric2=null;
    StartSong.lyric3=null;
    StartSong.userLyric1=null;
    StartSong.userLyric2=null;
    StartSong.userLyric3=null;
  }
  static void itemPrepare(){

    StartSong.lyric1="";
    StartSong.lyric2="";
    StartSong.lyric3="";
    StartSong.userLyric1="";
    StartSong.userLyric2="";
    StartSong.userLyric3="";
  }
  
  static Future<AudioPlayer> getAudio(Uint8List? bytes) async{
  var thePlayer=new AudioPlayer();
  await thePlayer.setAudioSource(MyJABytesSource(bytes));
  return thePlayer;
}

  static Future<int> getBlobData(String getTitle,String difficulty,String songName,String singer,String imageLink ) async {
  print("send 1");

  try{
    print(getTitle);
     if(SongSectionData.audioType=="Ielts"){
      getTitle="librarian"  ;
      difficulty="ieltsEasy";
      print(getTitle );
     }
    /*
    final response=await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio2/${getTitle}&${difficulty}'));
    */
    /*
  final response = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio1&${difficulty}'));//cheovzvxbc
  print("one more 1");
  final response11 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio2&${difficulty}'));//cheovzvxbc
  print("one more 2");
  final response12 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio3&${difficulty}'));//cheovzvxbc
  print("one more 3");
  */
 
  //final response13=await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getLyric/${getTitle}&${difficulty}'));
  print("receive all");
  int statusCode=200;
  if (statusCode == 200) {
    print("aw");
    itemPrepare();
    StartSong.title=songName;
      StartSong.singer=singer;
      StartSong.imageLink=imageLink;
      /*
    StartSong.forPlayer1=response.bodyBytes;
    StartSong.forPlayer2=response11.bodyBytes;
    StartSong.forPlayer3=response12.bodyBytes;
    */
    print("jinda");
    //print(AudioDB.audioUtama.length);
    List<dynamic> data=[];
    List<String> lyrics=[];
    if(SongSectionData.audioType=="Ielts"){
      lyrics=[
        "okay, everyone. So Here we are at the entrance to the town library",
        "my name is Ann, and i'm the chief librarian here",
        "well, as you see my desk is just on your right as you go in",  
      ];
      data=jsonDecode(AudioDB.audioKedua);
    }else{
      lyrics=[
        "I have died everyday, waiting for you",
        "One step closer",
        "For a thousand years",
      ];
     data=jsonDecode(AudioDB.audioUtama);}
    print(data.length);
    print("janda");
    StartSong.forPlayer1=base64Decode(data[0]);
    print("jandi");
    StartSong.forPlayer2=base64Decode(data[1]);
    StartSong.forPlayer3=base64Decode(data[2]);
    StartSong.player1=await getAudio(StartSong.forPlayer1);
    StartSong.player2=await getAudio(StartSong.forPlayer2);
    StartSong.player3=await getAudio(StartSong.forPlayer3);
    print("jaidi");
 
    var temp= lyrics;
    StartSong.lyric1=temp[0];
    StartSong.lyric2=temp[1];
    StartSong.lyric3=temp[2];
    print("lyric1: ${lyric1}");
    print("lyric2: ${lyric2}");
    print("lyric3: ${lyric3}");
   return 1;
  } else {
    return -1;
    //throw Exception('Failed to load Blob data');
  }}catch(e){
    print("iel ${e}");
    return -1;
  }
}

static Future<void> sendLyricAnswers() async{
  
}

}