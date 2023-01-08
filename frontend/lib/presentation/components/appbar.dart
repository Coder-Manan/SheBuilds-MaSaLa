import 'package:flutter/material.dart';

AppBar ourAppBar(String heading, context) {
  return AppBar(
    leading: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Image.asset('assets/images/logo-appbar.png')),
    backgroundColor: Colors.transparent,
    title: Text(
      heading,
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}
