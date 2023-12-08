import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/rankbox.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './homePage.dart';
import './accountPage.dart';
import '../controllers/leaderboardData.dart';
import '../database/leaderboardDB.dart';
class LeadPage extends StatelessWidget {
   String pageName = "LeadPage";
   LeadPage({super.key});
void _onItemTapped(int index) {
   // setState(() {
    if(index==0){
    Get.off(()=>HomePage()) ;
    }
    else if(index==2){
      Get.off(()=>AccountPage());
    }
    
      print(index);// = index;
   // } );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            padding: EdgeInsets.only(top: 30),
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff0fd3d5),
              Color(0xff20bcda),
              Color(0xff32a6df),
              Color(0xff4292e3),
              Color(0xff527ee7),
            ])),
            child: Column(children: [
              
              Image.asset("assets/images/piala.png"),
              SizedBox(
                height: 5,
              ),
              Text(
                "LEADERBOARD",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 210),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Stack(children: [
                  SingleChildScrollView(
                    child: Column(children: [
                      for (int i = 1; i < 21; i++)
                       RankBox( 
                            rank: i.toString(),
                            profile:
                                "https://images.saymedia-content.com/.image/t_share/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.jpg",
                                
                            username: LeaderboardDB.username![i-1],
                            exp: LeaderboardDB.points![i-1].toString()),
                            SizedBox(height: 80,)
                    ]),
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              color: Colors.transparent,
              elevation: 3,
              child: RankBox(
                /*
                LeaderboardData.
                LeaderboardData.tempdefaultscores
LeaderboardData.tempdefaultusernames
  LeaderboardData.tempdefaultuserposition
                 */
                  rank: 1.toString(),
                  profile:
                      "https://images.saymedia-content.com/.image/t_share/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.jpg",
                  username: LeaderboardData.tempdefaultusernames!.toString(),
                  exp:  LeaderboardDB.points[0].toString(),),
            ),
          )
        ],
      )
      ,bottomNavigationBar: BottomNavigationBar(backgroundColor: Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color.fromARGB(255, 34, 143, 231), 
        unselectedItemColor: Colors.grey, 
      onTap: _onItemTapped,
    )
    );
  }
}
