import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/presentation/components/appbar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar('MedCord', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 92,
          // ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 92, 0, 0),
            child: Text('You are set to go!',
                style: Theme.of(context).textTheme.headline1),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 13, 0, 0),
            child: Text(
                'Buy all you want and explore our wide range of products and consultancies',
                style: Theme.of(context).textTheme.bodyText1),
          ),
          const SizedBox(
            height: 288,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'Shop Now',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: AppTheme.scaffoldBackgroundColor),
                )),
          ),
        ],
      ),
    );
  }
}
