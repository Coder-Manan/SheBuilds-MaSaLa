import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/cart_entry.dart';
import 'package:frontend/domain/repositories/cart_repository.dart';

class CartScreenState extends Equatable {
  final List<CartEntry> cartItems;

  const CartScreenState({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}

abstract class CartScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// class IncreaseQuantityEvent extends CartScreenEvent {}

// class DecreaseQuantityEvent extends CartScreenEvent {}

class CartInitialEvent extends CartScreenEvent {}

class UpdateCartEvent extends CartScreenEvent {}

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(const CartScreenState(cartItems: [])) {
    // on<IncreaseQuantityEvent>(
    //     (IncreaseQuantityEvent event, Emitter<CartScreenState> emit) {});
    // on<DecreaseQuantityEvent>(
    //     (DecreaseQuantityEvent event, Emitter<CartScreenState> emit) {});
    on<CartInitialEvent>(
        (CartInitialEvent event, Emitter<CartScreenState> emit) async {
      //await CartRepository.getCart()
      emit(CartScreenState(cartItems: CartRepository.cart));
    });
    on<UpdateCartEvent>(
        (UpdateCartEvent event, Emitter<CartScreenState> emit) async {
      //await CartRepository.getCart()
      emit(CartScreenState(cartItems: CartRepository.cart));
    });
  }
}
