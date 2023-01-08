import 'package:flutter/material.dart';
import 'package:frontend/presentation/components/card.dart';

class TitledCardList extends StatelessWidget {
  const TitledCardList({
    super.key,
    required this.title,
    required this.cardsList,
  });

  final String title;
  final Map<String, Map<Image, Function?>> cardsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: cardsList.entries
                  .map((e) => HomePageCard(
                        image: e.value.keys.first,
                        data: e.key,
                        onClick: e.value.values.first,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
