import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: Image.asset('assets/images/logo-appbar.png')),
        backgroundColor: Colors.transparent,
        title: Text(
          'MedCord',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
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
