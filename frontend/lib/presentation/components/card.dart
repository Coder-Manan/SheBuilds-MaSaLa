import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key, required this.image, required this.data});

  final Image image;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(8),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image,
          Text(data),
        ],
      ),
    );
  }
}
