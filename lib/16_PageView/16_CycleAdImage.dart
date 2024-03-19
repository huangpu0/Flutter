import "package:flutter/material.dart";

class CycleAdImage extends StatelessWidget {
  final double width;
  final double height;
  final String asset;
  const CycleAdImage(
      {super.key,
      this.width = double.infinity,
      this.height = 200,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
      ),
    );
  }
}
