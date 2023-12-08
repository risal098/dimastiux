import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './homePage.dart';
import './accountPage.dart';
class LeadPage extends StatefulWidget {
  const LeadPage({super.key});

  @override
  State<LeadPage> createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {
  String pageName = "LeadPage";
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
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Container(
          height: height,
          color: Colors.indigo,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.3,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Column(children: [
                        Image(
                          image: AssetImage("assets/images/trophy.png"),
                          height: 80,
                        ),
                        Text(
                          "Leaderboard",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        TabBar(tabs: [
                          Tab(
                            text: "This Week",
                          ),
                          Tab(
                            text: "All Time",
                          )
                        ])
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.7,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Rank"),
                        Text("User Image"),
                        Text("Username"),
                        Text("User Score")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),bottomNavigationBar: BottomNavigationBar(backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      ),
    );
  }
}
