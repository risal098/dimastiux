import 'package:flutter/material.dart';

class UpBar extends StatelessWidget {
  const UpBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.08,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF527EE7),
            Color(0xFF15CAD7),
            Color(0xFF1CC2D9),
            Color(0xFF20BCDA),
            Color(0xFF0FD3D5),
          ],
        ),
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          // child: InkWell(
          //     onTap: () {},
          //     child: const Icon(
          //       Icons.arrow_back_rounded,
          //       color: Colors.white,
          //     ))
          ),
    );
  }
}
