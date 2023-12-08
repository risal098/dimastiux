import 'package:dimastiui/screens/searchPage.dart';
import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';
import '../widgets/favcard.dart';
import '../widgets/songcard.dart';
import '../widgets/songlevel.dart';
import '../controllers/songSectionData.dart';
class SeeMore extends StatelessWidget {
  String pageName = "SongSection";
  SeeMore({super.key});
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
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
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
                      const StateSongLevel(),
                      SizedBox(height: 10,),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: (height >= 840) ? (height *8/10) : (height *7/10),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                           
                            for (int i = 0; i < songList!.length; i++)
                              SongCard(imageList![i], songList[i], singerist![i],getTitleList![i],context)
                     
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
