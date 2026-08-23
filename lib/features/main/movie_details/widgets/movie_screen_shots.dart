import 'package:flutter/material.dart';

class MovieScreenShots extends StatelessWidget {
  final String image;
  const MovieScreenShots({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(child: Image.asset(image, fit: .cover));
  }
}
