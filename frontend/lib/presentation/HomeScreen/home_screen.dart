import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/repositories/cart_repository.dart';
import 'package:frontend/presentation/HomeScreen/home_screen_bloc.dart';
import 'package:frontend/presentation/components/appbar.dart';
import 'package:frontend/presentation/components/horizontal_card_list_with_heading.dart';
import 'package:frontend/presentation/components/search_bar.dart';

// class _MyClip extends CustomClipper<RRect> {
//   final BuildContext context;

//   const _MyClip({required this.context});

//   @override
//   Rect getClip(Size size) {
//     return RRect.fromLTRBR(left, top, right, bottom, radius);
//   }

//   @override
//   bool shouldReclip(oldClipper) {
//     return false;
//   }
// }

class _MyClip extends CustomClipper<Rect> {
  final BuildContext context;

  const _MyClip({required this.context});

  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 330, 170);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const id = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: ((context, state) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              TitledCardList(
                  title: 'Products',
                  cardsList: state.products.map((key, value) =>
                      MapEntry(key.name!, {value: CartRepository.addToCart}))),
                      const SizedBox(height: 23,),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Image.asset('assets/images/offer-image.png'),
              ),
              TitledCardList(
                  title: 'Partners',
                  cardsList: state.suppliers.map((key, value) => MapEntry(key, {
                        Image.network(
                          value,
                          width: 81,
                          height: 81,
                        ): null
                      }))),
                      const SizedBox(height: 23,),
          ],
        );
      }),
    );
  }
}
