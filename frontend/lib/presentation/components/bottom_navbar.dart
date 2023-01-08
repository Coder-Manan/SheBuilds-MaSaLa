import 'package:flutter/material.dart';
import 'package:frontend/presentation/CartScreen/cart_screen.dart';
import 'package:frontend/presentation/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

Row ourNavBar(String screen) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          screen == 'home' ? null : Get.toNamed(HomeScreen.id);
        },
        child: Image.asset(screen == 'home'
            ? 'assets/images/home-active.png'
            : 'assets/images/home.png'),
      ),
      Image.asset('assets/images/profile.png'),
      GestureDetector(
        onTap: () {
          screen == 'cart' ? null : Get.toNamed(CartScreen.id);
        },
        child: Image.asset(screen == 'cart'
            ? 'assets/images/cart-active.png'
            : 'assets/images/cart.png'),
      ),
    ],
  );
}
