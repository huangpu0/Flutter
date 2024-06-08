import 'package:flutter/material.dart';

class ModuleSubItem extends StatelessWidget {
  final String title;
  final Widget wchild;
  const ModuleSubItem({super.key, required this.title, required this.wchild});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 15,
            bottom: 1,
            width: 100,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 115,
            right: 15,
            top: 8,
            bottom: 8,
            child: wchild,
          ),
        ],
      ),
    );
  }
}
