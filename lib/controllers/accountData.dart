import 'package:http/http.dart' as http;
import 'dart:convert';
class AccountData{
  //basic accound data
  static int? isPrem=1;
  static String? username="risal";
  static int? userId=11;
  static String? email="risal@gmail.com";
  static int? permissionStatus=1;
  static String? deadlinePermission="23 12 2022";
  static int playedAudioToday=0;

  static int state=1; //when changed
  static int sendingScoreState=0; 
  //statistic data;
  static Map<String,dynamic>? weeklyStat={
  "Sunday":5,
  "Monday":6,
  "Tuesday":4,
  "Wednesday":5,
  "Thursday":8,
  "Friday":18,
  "Saturday":0,
};

  static int? weeklyProgress=56;
  static int? weeklyTarget=80;

  static int? points=1477;
  static int? activeDays=7;
  static int? activeDaystreaks=5;
  static int? totalReplay=3;
  static int? playedSongs=30;
  static int? playedIelts=26;
  static int? weeklyProgresPercentage=((weeklyProgress!/weeklyTarget!)*100).toInt();
  /*
static Future<void> getData()async{
  var    response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","getMyData"),
                  body:AccountData.userId.toString());
                  var data=jsonDecode(response.body);
                  
                  AccountData.weeklyTarget=data[0];
                  AccountData.weeklyProgress=data[1];
                  AccountData.weeklyStat=jsonDecode(data[2]);
  
                  AccountData.weeklyProgresPercentage=(((AccountData.weeklyProgress!/AccountData.weeklyTarget!)*100).round());
                  if(AccountData.weeklyProgresPercentage!>100){
                    AccountData.weeklyProgresPercentage=100;
                  }
                  AccountData.activeDays=data[3];
                AccountData.activeDaystreaks=data[4];
                    AccountData.points=data[5];
                    AccountData.playedSongs=data[6];
                AccountData.playedIelts=data[7];
                AccountData.totalReplay=data[8];
                 AccountData.state=0;
}
  */
}