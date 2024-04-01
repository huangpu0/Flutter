import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final String title;
  const HomePageItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 15,
            right: 15,
            bottom: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 15,
            right: 0,
            bottom: 1,
            child: Divider(
              height: 1,
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
