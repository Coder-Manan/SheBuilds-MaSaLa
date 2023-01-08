import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard(
      {super.key, required this.image, required this.data, this.onClick});

  final Image image;
  final String data;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(8),
      )),
      child: Row(
        children: [
          SizedBox(
            height: 116 + 5,
            width: 117 + 4,
            child: GestureDetector(
              onTap: onClick != null
                  ? () {
                      onClick!(data);
                    }
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  image,
                  Text(
                    data,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: AppTheme.scaffoldBackgroundColor, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
