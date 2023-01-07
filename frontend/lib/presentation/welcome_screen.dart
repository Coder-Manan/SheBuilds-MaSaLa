import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo-appbar.png'),
        backgroundColor: Colors.transparent,
        title: const Text('MedCord'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 92,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 92, 0, 0),
            child: const Text('You are set to go'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 92, 0, 0),
            child: const Text('You are set to go'),
          ),
          const SizedBox(
            height: 288,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('Shop Now')),
        ],
      ),
    );
  }
}
