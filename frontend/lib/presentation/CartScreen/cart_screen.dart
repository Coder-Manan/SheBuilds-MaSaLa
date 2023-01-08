import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/CartScreen/cart_card.dart';
import 'package:frontend/presentation/CartScreen/cart_screen_bloc.dart';
import 'package:frontend/presentation/components/appbar.dart';

// class CartCard extends StatefulWidget {
//   const CartCard({super.key});

//   @override
//   State<CartCard> createState() => _CartCardState();
// }

// class _CartCardState extends State<CartCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 176,
//         width: 159,
//         child: Center(child: Column(
//           children: [
//             //image,
//             Row(
//               children: [
//                 //dec quantity button,
//                 Column(
//                   children: [
//                     //name,
//                     //quantity
//                   ],
//                 ),
//                 //add quantity button
//               ],
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const id = 'cart';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: ((context, state) {
        return Scaffold(
          appBar: ourAppBar('Cart', context),
          body: Column(
            children: [
              Text('Products', style: Theme.of(context).textTheme.headline1),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: state.cartItems
                    .map((e) => NewCard(
                          cartItem: e,
                        ))
                    .toList(),
              )
            ],
          ),
        );
      }),
    );
  }
}
