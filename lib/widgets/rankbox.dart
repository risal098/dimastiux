import 'package:flutter/material.dart';

class RankBox extends StatelessWidget {
  final String rank;
  final String profile;
  final String username;
  final String exp;
  const RankBox({
    required this.rank,
    required this.profile,
    required this.username,
    required this.exp,
    super.key});

  @override
  Widget build(BuildContext context) {
    var color = Colors.transparent;
    if (this.rank=="1"){
      color = Color(0xffFFC107);
    } else if(this.rank == "2"){
      color = Colors.grey;
    } else if(this.rank == "3"){
      color = const Color.fromARGB(255, 199, 105, 71);
    }
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      width: width,
      height: 68,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xff527ee7),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: (rank.length<=2)?37:60,
                child: Text(
                  this.rank, textAlign:TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff527ee7),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: color,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      "https://images.saymedia-content.com/.image/t_share/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.jpg"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                this.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff527ee7),
                ),
              )
            ],
          ),
          Text(
            this.exp+" XP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xff527ee7),
            ),
          )
        ],
      ),
    );
  }
}
