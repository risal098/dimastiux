import 'package:dimastiui/controllers/songSectionData.dart';
import 'package:flutter/material.dart';

  Card FavCard(String imageLink, String song, String singer) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(50), // Image radius
                child: Image(image: (SongSectionData.audioType!="Ielts")?AssetImage(imageLink):AssetImage("assets/images/ieltHome.png"), fit: BoxFit.cover,),
              ),
            ),
            Text(
              song,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(singer, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }