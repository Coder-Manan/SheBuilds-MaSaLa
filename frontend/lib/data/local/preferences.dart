import 'package:frontend/domain/models/cart_entry.dart';
import 'package:frontend/domain/models/medicine.dart';
import 'package:hive/hive.dart';

class Preferences {
  static late Box _itemsBox;
  static late Box _cartBox;

  Future<void> _startInstance() async {
    _itemsBox = await Hive.openBox('box');
    _cartBox = await Hive.openBox('cartBox');
  }

  Future<void> initialize(Map<String, dynamic> json) async {
    _startInstance();
    Hive.registerAdapter(CartEntryAdapter());
    Hive.registerAdapter(MedicineAdapter());
    List<Map<String, dynamic>> medicines = json['medicines']; //array of jsons
    for (Map<String, dynamic> element in medicines) {
      _itemsBox.put(element['name'], Medicine.fromJson(element));
    }
  }

  Future<void> addItem(Medicine item, int quantity) async {
    _cartBox.put(
        item.name,
        CartEntry(
            item: item,
            quantity: quantity,
            totalPrice: quantity * item.price!));
  }

  Future<void> removeItem(Medicine item) async {
    _cartBox.delete(item.name);
  }

  Future<void> changeQuantity(int newQuantity, Medicine item) async {
    _cartBox.put(item.name, newQuantity * item.price!); //check for max quantity
  }
}
