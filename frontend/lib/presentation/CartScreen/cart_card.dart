import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/cart_entry.dart';
import 'package:frontend/domain/repositories/cart_repository.dart';
import 'package:frontend/presentation/CartScreen/cart_screen_bloc.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key, required this.cartItem});
  final CartEntry cartItem;
  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    final CartEntry cartItem = widget.cartItem;
    int quantity = cartItem.quantity!;
    return Center(
      child: Align(
        child: SizedBox(
          height: 159,
          width: 176,
          child: Center(
            child: Card(
              child: Center(
                child: Column(
                  children: [
                    Image.network(
                      cartItem.item!.imgSrc!,
                      width: 81,
                      height: 81,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              CartRepository.decreaseQuantity(cartItem.item!);
                              setState(() {
                                quantity -= 1;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        Column(
                          children: [
                            Text(cartItem.item!.name!),
                            Text('$quantity no.s')
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              CartRepository.increaseQuantity(cartItem.item!);
                              setState(() {
                                quantity += 1;
                              });
                            },
                            icon: const Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CartCard extends StatelessWidget {
//   const CartCard({super.key, required this.cartItem, required this.mbloc});
//   final CartEntry cartItem;
//   final CartScreenBloc mbloc;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 159,
//       width: 176,
//       child: Card(
//         child: Center(
//           child: Column(
//             children: [
//               Image.network(
//                 cartItem.item!.imgSrc!,
//                 width: 81,
//                 height: 81,
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         CartRepository.decreaseQuantity(cartItem.item!);
//                         mbloc.add(CartInitialEvent());
//                       },
//                       icon: const Icon(Icons.remove)),
//                   Column(
//                     children: [
//                       Text(cartItem.item!.name!),
//                       Text('${cartItem.quantity!.toString()} no.s')
//                     ],
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         CartRepository.increaseQuantity(cartItem.item!);
//                         mbloc.add(CartInitialEvent());
//                       },
//                       icon: const Icon(Icons.add))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
