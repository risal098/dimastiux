import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controllers/accountData.dart';
class TargetCard extends StatefulWidget {
  const TargetCard({super.key});

  @override
  State<TargetCard> createState() => _TargetCardState();
}

class _TargetCardState extends State<TargetCard> {

  @override
  Widget build(BuildContext context) {
    String target = AccountData.weeklyTarget.toString()+" Audio";
    String spended = AccountData.weeklyProgress.toString()+" Audio";

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      alignment: Alignment.center,
      height: 138,
      width: width,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 177, 212).withOpacity(0.59)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularPercentIndicator(
            radius: 46,
            percent: AccountData.weeklyProgresPercentage!/100,
            circularStrokeCap: CircularStrokeCap.round,
            lineWidth: 8,
            progressColor:Color.fromARGB(255, 8, 43, 95),// Color(0xff528DE7),
            animation: true,
            animationDuration: 800,
            animateFromLastPercent: true,
            backgroundColor: Colors.white,
            center: Text("${AccountData.weeklyProgresPercentage}%", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, 
            color: Color.fromARGB(255, 8, 43, 95)),),
            ),
          TextTarget("Target", target),
          TextTarget("Played Audio", spended),
        ],
      ),
    );
  }

  Column TextTarget(String title, String hours) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          hours,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
