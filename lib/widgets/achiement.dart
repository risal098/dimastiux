import 'package:flutter/material.dart';
import '../controllers/accountData.dart';
import 'package:dimastiui/widgets/box_achv.dart';
class AchievementCard extends StatefulWidget {
   AchievementCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  /*
    static int? points;
  static int? activeDays;
  static int? activeDaystreaks;
  static int? totalReplay;
  static int? playedSongs;
  static int? playedIelts;
  */ 
   int activeDays = AccountData.activeDays!;
   int activeStreak = AccountData.activeDaystreaks!;
   int points = AccountData.points!;
   double averageReplay =  double.parse((AccountData.totalReplay!/(AccountData.playedSongs!+AccountData.playedIelts!)).toStringAsFixed(2));
   //double.parse((12.3412).toStringAsFixed(2))
   int playedSong = AccountData.playedSongs!;
   int playeDialogue = AccountData.playedIelts!;

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    // final double Yay = AchievementCard.height;
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      // height: (height > 850) ?(height * 140 / 800):(height * 140 / 800)+45,
      width: width,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [AchivItems(points, "Total Pointss"),
        SizedBox(height: 10,),
        BoxAchv(name: "Active Days", value: activeDays.toString(), endText: "days"),
        BoxAchv(name: "Highest Streak", value: activeStreak.toString(), endText: "days"),
        BoxAchv(name: "Average Replays", value: averageReplay.toString(), endText: "times"),
        BoxAchv(name: "Played Songs", value: playedSong.toString(), endText: "audio"),
        BoxAchv(name: "Played Dialogues", value: playeDialogue.toString(), endText: "audio"),
          
        ],
      ),
    );
  }

  SizedBox AchivItems(int data, String name) {
    return SizedBox(
      // width: 300,
      child: Column(
        children: [
          Text(
            data.toString()+" XP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, height: 1),
          )
        ],
      ),
    );
  }
}
