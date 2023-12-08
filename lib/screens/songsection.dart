import 'package:dimastiui/database/songListDB.dart';
import 'package:dimastiui/screens/searchPage.dart';
import 'package:dimastiui/screens/seemore_page.dart';
import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';
import '../widgets/favcard.dart';
import '../widgets/songcard.dart';
import '../widgets/songlevel.dart';
import 'package:get/get.dart';
import '../controllers/songSectionData.dart';
class SongSection extends StatelessWidget {
  String pageName = "SongSection";
  SongSection({super.key});
  static var level = Level.level;
 
  

  @override
  Widget build(BuildContext context) {
    
    var imageList = SongSectionData.imageLink;
    var songList = SongSectionData.titles;
    var singerist = SongSectionData.singer;
    var getTitleList = SongSectionData.getTitle;

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    String audioTypeTitle=" Section";
    
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Color(0xff15CAD7),
                    Color(0xffE8E8E8),
                    Color(0xffE8E8E8)
                  ])),
              child: Padding(
                  padding: (height >= 840)
                      ? EdgeInsets.only(
                          top: 0.04 * height,
                          left: 0.05 * width,
                          right: 0.05 * width)
                      : EdgeInsets.only(
                          top: 0.03 * height,
                          left: 0.072 * width,
                          right: 0.072 * width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Row(
                        children: <Widget>[
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon:
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            SongSectionData.audioType!+audioTypeTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: (height >= 840) ? 10 : 0,
                      ),
                      Stack(
                        children: [
                          const SearchingBar(),
                          InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return SearchPage();}));
                          },
                          child: Container(
                            height: 45,
                            width: width,
                          ),
                        ),
                        ],
                      ),
                       
                      SizedBox(
                        height: (height >= 840) ? 10 : 0,
                      ),
                      const Text(
                        "Recommendation",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 150,
                        width: width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < songList!.length; i++)
                              Container(
                                width: 120,
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: FavCard(
                                    SongListDB.songList[i][4],
                                    songList[i], singerist![i]),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Play Random Song
                      Container(
                        height: height * (71 / 800),
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  const Color(0xff528DE7).withOpacity(0.95),
                                  const Color(0xff20BCDA).withOpacity(0.95),
                                  const Color(0xff1CC2D9).withOpacity(0.95),
                                  const Color(0xff0FD3D5),
                                  const Color(0xff0FD3D5)
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Play Random Song",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),

                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * (34 / 800),
                                  width: 92,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff528DE7)
                                          .withOpacity(0.95),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "Play",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Song List",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){return SeeMore();}));
                                  },
                                  child: const Text(
                                    "See More",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      const StateSongLevel(),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: (height >= 840) ? (height / 2.5) : (height / 3),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                           
                            for (int i = 0; i < songList!.length; i++)
                              SongCard(SongListDB.songList[i][4], songList[i], singerist![i],getTitleList![i],context)
                     
                          ],
                        )),
                      )
                    ],
                  ))),
        ),
      ),
      
    );
  }
}
