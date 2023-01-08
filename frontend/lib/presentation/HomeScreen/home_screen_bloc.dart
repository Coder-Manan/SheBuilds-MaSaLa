import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/cart_entry.dart';
import 'package:frontend/domain/models/medicine.dart';
import 'package:frontend/domain/repositories/cart_repository.dart';
import 'package:frontend/domain/repositories/products_repository.dart';
import 'package:frontend/domain/repositories/supplier_repository.dart';

class HomeScreenState extends Equatable {
  final Map<String, String> suppliers;
  final List<CartEntry> cart;
  final Map<Medicine, Image> products;

  const HomeScreenState(
      {required this.suppliers, required this.cart, required this.products});

  @override
  List<Object?> get props => [suppliers, cart];
}

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc()
      : super(const HomeScreenState(suppliers: {}, cart: [], products: {})) {
    on<InitialEvent>((InitialEvent event, Emitter<HomeScreenState> emit) async {
      //await getCart();
      emit(HomeScreenState(
          suppliers: SupplierRepository.dummyData(),
          cart: CartRepository.dummyData(),
          products: Map<Medicine, Image>.fromEntries(
              ProductsRepository.dummyData().map((e) => MapEntry(
                  e,
                  Image.network(
                    e.imgSrc!,
                    width: 81,
                    height: 81,
                  ))))));
    });
  }
}
