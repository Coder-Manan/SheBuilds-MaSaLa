import 'package:hive/hive.dart';

part 'medicine.g.dart';

@HiveType(typeId: 1)
class Medicine {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? desc;

  @HiveField(2)
  String? supplier;

  @HiveField(3)
  int? price;

  Medicine(
      {required this.name,
      required this.desc,
      required this.supplier,
      required this.price});

  Medicine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    supplier = json['supplier'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'desc': desc, 'supplier': supplier, 'price': price};
  }
}
