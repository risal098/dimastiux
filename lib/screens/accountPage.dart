import 'package:dimastiui/screens/about_us.dart';
import 'package:dimastiui/screens/tos_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import './homePage.dart';
//import './songGrade.dart';
import './lead_page.dart';
import './progress.dart';
import '../controllers/leaderboardData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/accountData.dart';
class AccountPage extends StatefulWidget{
  AccountPage({super.key});

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage>{
String pageName = "AccountPage";
MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);

void _onItemTapped(int index) {
   // setState(() {
   
    if(index==0){
      
    Get.off(()=>HomePage()) ;
    }
    else if(index==1){
    //  await LeaderboardData.getData();
      LeaderboardData.getData()!.whenComplete(() {print("lanjut"); Get.off(()=>LeadPage()) ;});
    }
    
      print(index);// = index;
   // } );
  }
  @override
  Widget build (BuildContext context){
    return SafeArea(
        child: Scaffold(
          extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
      body:Container( //expanded
      child:Container(
        decoration: BoxDecoration(
                  
                    gradient: LinearGradient(
                        begin: Alignment(1, 0.1),
                        end: Alignment(0, 0.1),
                        colors: [
                          
                      Color(0XFF0FD3D5),
                      Color(0XFF1BC2D8).withOpacity(0.88),
                      Color.fromARGB(255, 76, 144, 247)
                      
                    ]
                    )
                    ),
        child:Stack(
        alignment: Alignment.center,
      children:[Container(child:Column( //expanded
        children:[ Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height*1/4,
                
                decoration: BoxDecoration(
                  
                    gradient: LinearGradient(
                        begin: Alignment(1, 0.1),
                        end: Alignment(0, 0.1),
                        colors: [
                          
                      Color(0XFF0FD3D5),
                      Color(0XFF1BC2D8).withOpacity(0.88),
                      Color.fromARGB(255, 76, 144, 247)
                      
                    ]
                    )
                    ),
                    ),
                    Expanded(child: //expanded
                    Container(
                    
                   
                    width:MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                     ),
                child: Column(
                      children: [
                        Text(""),
                        Text(""),
                        Text(""),
                        Text(""),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              accountOption(MediaQuery.of(context)),
                              statOption(MediaQuery.of(context)),
                              TermsOfService(MediaQuery.of(context), context),
                              helpOption(MediaQuery.of(context), context),
                              // otherAppOption( mediaQueryData)
                          ],
                          )
                        )
                        
                      ],
                    ),
                      
                      
                    ),
                    )
                    
        ]
      )
      ),
  
      Positioned(top:mediaQueryData.size.height*1/3-110,
      child: profileImage())
      ]
      )
      )
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
        currentIndex: 2,
        selectedItemColor: Color.fromARGB(255, 34, 143, 231), 
        unselectedItemColor: Colors.grey, 
      onTap: _onItemTapped,
    )
    )
    );
  }
Widget profileImage(){
  return CircleAvatar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    backgroundImage: AssetImage("assets/images/img_ellipse_8.png"),
    radius: 45,
  );
}
}
//options=======================================================================================================================================

Widget accountOption(MediaQueryData mediaQueryData){
  return InkWell(
    onTap:(){print("tes");},
    child:Container(
    padding: EdgeInsets.all(16),
    width: mediaQueryData.size.width,
    child: Row(children: [
      Text("          "),
      Image(image:AssetImage("assets/images/accAccl.png"),
      height: 30,
      width: 30,
    ),
    Text("      "),
    Text(" "),
    Text("Account"),
    Expanded(child: Container( //expanded
      alignment: Alignment.centerRight,
      child: Image(image:AssetImage("assets/images/arrowAcc.png")),
    ))
    ]
    
    ,),
    
  )
  );
}

Widget statOption(MediaQueryData mediaQueryData){
  return InkWell(
    onTap:()async{
       if(AccountData.state==1){
                  var    response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","getMyData"),
                  body:AccountData.userId.toString());
                  var data=jsonDecode(response.body);
                  
                  AccountData.weeklyTarget=data[0];
                  AccountData.weeklyProgress=data[1];
                  AccountData.weeklyStat=jsonDecode(data[2]);
  
            
                  AccountData.activeDays=data[3];
                AccountData.activeDaystreaks=data[4];
                    AccountData.points=data[5];
                    AccountData.playedSongs=data[6];
                AccountData.playedIelts=data[7];
                AccountData.totalReplay=data[8];
                 AccountData.state=0;
                  Get.to(()=>ProgressPage());
                
      }else{
      Get.to(()=>ProgressPage());
        }
      },
    child:Container(
    padding: EdgeInsets.all(16),
    width: mediaQueryData.size.width,
    child: Row(children: [
      Text("          "),
      Image(image:AssetImage("assets/images/stat.png"),
      height: 30,
      width: 30,
    ),
    Text("      "),
    Text(" "),
    Text("Progress"),
    Expanded(child: Container( //expanded
      alignment: Alignment.centerRight,
      child: Image(image:AssetImage("assets/images/arrowAcc.png")),
    ))
    ]
    
    ,),
  ));
}

Widget TermsOfService(MediaQueryData mediaQueryData, context){
  return InkWell(
    onTap:(){
      MyshowDialog.showToSDialog(context);
    },
    child:Container(
    padding: EdgeInsets.all(16),
    width: mediaQueryData.size.width,
    child: Row(children: [
      Text("          "),
      Icon(Icons.my_library_books_rounded, size: 30,),
    Text("      "),
    Text(" "),
    Text("Terms of Service",),
   Expanded(child: Container( //expanded
      alignment: Alignment.centerRight,
      child: Image(image:AssetImage("assets/images/arrowAcc.png")),
    ))
    ]
    
    ,),
  ));
}

Widget helpOption(MediaQueryData mediaQueryData, context){
  return InkWell(
    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context){return AboutUs();}));},
    child:Container(
    padding: EdgeInsets.all(16),
    width: mediaQueryData.size.width,
    child: Row(children: [
      Text("          "),
      Image(image:AssetImage("assets/images/help.png"),
      height: 30,
      width: 30,
    ),
    Text("      "),
    Text(" "),
    Text("About Us"),
    Expanded(child: Container( //expanded
      alignment: Alignment.centerRight,
      child: Image(image:AssetImage("assets/images/arrowAcc.png")),
    ))
    ]
    
    ,),
  ));
}

Widget otherAppOption(MediaQueryData mediaQueryData){
  return InkWell(
    onTap:(){},
    child:Container(
    padding: EdgeInsets.all(16),
    width: mediaQueryData.size.width,
    child: Row(children: [
      Text("          "),
      Image(image:AssetImage("assets/images/other.png"),
      height: 30,
      width: 30,
    ),
    Text("      "),
    Text(" "),
    Text("OtherApp"),
    Expanded(child: Container( //Expanded
      alignment: Alignment.centerRight,
      child: Image(image:AssetImage("assets/images/arrowAcc.png")),
    ))
    ]
    
    ,),
  ));
}
