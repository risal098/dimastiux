import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({super.key});

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 30),
            hintText: "Search",
            hintStyle: const TextStyle(height: 2),
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none
              )
          ),
        );
  }
}
