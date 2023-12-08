import 'package:flutter/material.dart';

class BoxAchv extends StatelessWidget {
  final String name;
  final String value;
  final String endText;
  const BoxAchv({
    required this.name,
    required this.value,
    required this.endText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 0, 179, 214).withOpacity(0.26)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontSize: 16),),
                Text(value+" "+endText, style: TextStyle(fontSize: 16))
            ]),
          );
  }
}