import 'package:flutter/material.dart';
import 'package:frontend/presentation/components/card.dart';

class TitledCardList extends StatelessWidget {
  const TitledCardList(
      {super.key, required this.title, required this.cardsList});

  final String title;
  final Map<String, Image> cardsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, textAlign: TextAlign.left),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: cardsList.entries
                .map((e) => HomePageCard(image: e.value, data: e.key))
                .toList(),
          ),
        )
      ],
    );
  }
}
