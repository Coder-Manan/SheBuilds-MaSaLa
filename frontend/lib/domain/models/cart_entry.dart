import 'package:hive/hive.dart';

import 'medicine.dart';

part 'cart_entry.g.dart';

@HiveType(typeId: 2)
class CartEntry {
  @HiveField(0)
  Medicine? item;

  @HiveField(1)
  int? quantity;

  @HiveField(2)
  int? totalPrice;

  CartEntry({this.item, this.quantity, this.totalPrice});

  CartEntry.fromJson(Map<String, dynamic> json) {
    item = Medicine.fromJson(json['medicine']);
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
  }

  // void addItem(Item item, int quantity) {
  //   // {'quantity': x, 'total price': y} is the desc
  //   itemCartDesc!.addAll({
  //     item: {'quantity': quantity, 'total price': quantity * item.price!}
  //   });
  // }

  // void removeItem(Item item) {
  //   itemCartDesc!.remove(item);
  // }
}

//store cart locally till order is placed