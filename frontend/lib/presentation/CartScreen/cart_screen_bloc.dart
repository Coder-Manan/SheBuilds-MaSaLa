import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenState extends Equatable {
  final List<Map<String, dynamic>> cartItems;

  const CartScreenState({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}

abstract class CartScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncreaseQuantityEvent extends CartScreenEvent {}

class DecreaseQuantityEvent extends CartScreenEvent {}

class InitialEvent extends CartScreenEvent {}

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenState()) {
    on<IncreaseQuantityEvent>(
        (IncreaseQuantityEvent event, Emitter<CartScreenState> emit) {});
    on<DecreaseQuantityEvent>(
        (DecreaseQuantityEvent event, Emitter<CartScreenState> emit) {});
    on<InitialEvent>((InitialEvent event, Emitter<CartScreenState> emit) {});
  }
}
