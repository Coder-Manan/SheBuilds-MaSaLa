import 'package:frontend/domain/models/cart_entry.dart';
import 'package:frontend/domain/models/medicine.dart';
import 'package:frontend/domain/repositories/products_repository.dart';

class CartRepository {
  static List<CartEntry> cart = [
    {
      'medicine': {
        'name': 'med1',
        'desc': 'dummy desc',
        'supplier': 'dummy supplier',
        'price': 10,
        'imgSrc':
            'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
      },
      'quantity': 5,
      'totalPrice': 50,
    },
    {
      'medicine': {
        'name': 'med2',
        'desc': 'dummy desc',
        'supplier': 'dummy supplier',
        'price': 15,
        'imgSrc':
            'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
      },
      'quantity': 3,
      'totalPrice': 45,
    },
    {
      'medicine': {
        'name': 'med3',
        'desc': 'dummy desc',
        'supplier': 'dummy supplier',
        'price': 12,
        'imgSrc':
            'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
      },
      'quantity': 3,
      'totalPrice': 36,
    }
  ].map((e) => CartEntry.fromJson(e)).toList();

  static Future<List<CartEntry>> getCart() async {
    if (cart == []) {
      //ping server
    }
    return cart;
  }

  static String addToCart(String medicineName) {
    print('add request received $medicineName');
    for (var entry in cart) {
      if (entry.item!.name == medicineName) {
        return 'already in cart';
      }
    }
    cart.add(CartEntry(
        item: ProductsRepository.availableMedicines!
            .firstWhere((element) => element.name == medicineName),
        quantity: 1,
        totalPrice: ProductsRepository.availableMedicines!
            .firstWhere((element) => element.name == medicineName)
            .price!));
    print(cart.toString());
    return 'successful';
  }

  static increaseQuantity(Medicine medicine) {
    cart[cart.indexWhere((element) => element.item == medicine)].quantity =
        (cart[cart.indexWhere((element) => element.item == medicine)]
                .quantity! +
            1);
    cart[cart.indexWhere((element) => element.item == medicine)].totalPrice =
        (cart[cart.indexWhere((element) => element.item == medicine)]
                .totalPrice! +
            medicine.price!);
  }

  static decreaseQuantity(Medicine medicine) {
    cart[cart.indexWhere((element) => element.item == medicine)].quantity =
        (cart[cart.indexWhere((element) => element.item == medicine)]
                .quantity! -
            1);
    if (cart[cart.indexWhere((element) => element.item == medicine)].quantity ==
        0) {
      cart.removeWhere((element) => element.item == medicine);
      return;
    }
    cart[cart.indexWhere((element) => element.item == medicine)].totalPrice =
        (cart[cart.indexWhere((element) => element.item == medicine)]
                .totalPrice! -
            medicine.price!);
  }

  static List<CartEntry> dummyData() {
    List<Map<String, dynamic>> dummyJson = [
      {
        'medicine': {
          'name': 'med1',
          'desc': 'dummy desc',
          'supplier': 'dummy supplier',
          'price': 10,
          'imgSrc':
              'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
        },
        'quantity': 5,
        'totalPrice': 50,
      }
    ];
    return cart = dummyJson.map((e) => CartEntry.fromJson(e)).toList();
  }
}
