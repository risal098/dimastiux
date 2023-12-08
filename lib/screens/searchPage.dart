
import 'package:dimastiui/controllers/songSectionData.dart';
import 'package:dimastiui/database/songListDB.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:dimastiui/widgets/songcard.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String pageName = "SearchPage";
  List<String> displayListsong = List.from(SongSectionData.titles!);
  var displayListgsong = List.from(SongSectionData.getTitle!);
  var displayListsinger = List.from(SongSectionData.singer!);
  var originImage = [SongListDB.songList[0][4], SongListDB.songList[1][4]];
  var displayListimage = [SongListDB.songList[0][4], SongListDB.songList[1][4]];
  void bestmatch(List<String?> values, String value){
    if (values.length>1){
      int indxbest = value.bestMatch(values).bestMatchIndex;
      var temp = values[0];
      values[0] = values[indxbest];
      values[indxbest] = temp;

    }
  }

  void updatedlist(String value){
    setState(() {
      if (value == ""){
        displayListsong = List.from(SongSectionData.titles!);
        displayListgsong = List.from(SongSectionData.getTitle!);
        displayListsinger = List.from(SongSectionData.singer!);
        displayListimage = originImage;
      } else{
      const double similarityValue = 0.2;
      displayListsong = SongSectionData.titles!
        .where((element) => element.toLowerCase().similarityTo(value.toLowerCase()) > similarityValue)
        .toList();
      if (displayListsong.length==0){
        displayListsong = SongSectionData.titles!.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
      }
      bestmatch(displayListsong, value);
      displayListgsong = displayListsong
          .map((title) => SongSectionData.getTitle![SongSectionData.titles!.indexOf(title)])
          .toList();

      displayListsinger = displayListsong
          .map((title) => SongSectionData.singer![SongSectionData.titles!.indexOf(title)])
          .toList();
      displayListimage = displayListsong
          .map((title) => originImage[SongSectionData.titles!.indexOf(title)])
          .toList();
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        backgroundColor: Color(0xffE8E8E8),
        body: SizedBox(
            height: height,
            child: SingleChildScrollView(
                child: Container(
                    width: width,
                    height: height,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [IconButton(onPressed: (){
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
                                    "Search for a audio",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: (value){updatedlist(value);},
                                textInputAction: TextInputAction.go,
                                autofocus: true,
                                onSubmitted: (value) {
                                  print("search");
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsets.only(left: 30),
                                    hintText: "Search",
                                    hintStyle: const TextStyle(height: 2),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none)),
                              ),
                              SizedBox(height: 20,),
                              Expanded(child: (displayListsong.isEmpty ==true)
                              ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10*height/100,),
                                    SvgPicture.asset("assets/images/search_img.svg", width: 70*width/100,),
                                    SizedBox(height: 50,),
                                    Text("We couldn't found any matches data", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff528DE7), fontSize: 30, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text("Please check again or try different search term", textAlign: TextAlign.center, style: TextStyle(fontSize: 16),)
                                  ],
                                ),
                              )
                              :ListView.builder(
                                itemCount: displayListsong.length,
                                itemBuilder: (context, index) {
                                  return SongCard(displayListimage[index], displayListsong[index], displayListsinger[index], displayListgsong[index], context);
                                },

                              ))
                            ]))))));
  }
}
