import 'package:frontend/domain/models/medicine.dart';

class ProductsRepository {
  static List<Medicine>? availableMedicines = [
    {
      'name': 'med1',
      'desc': 'dummy desc',
      'supplier': 'dummy supplier',
      'price': 10,
      'imgSrc':
          'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
    },
    {
      'name': 'med2',
      'desc': 'dummy desc - 2',
      'supplier': 'dummy supplier - 2',
      'price': 15,
      'imgSrc':
          'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
    }
  ].map((e) => Medicine.fromJson(e)).toList();

  static Future<List<Medicine>> getAllMeds() async {
    if (availableMedicines == null) {
      //ping server, get meds and return them;
      return [];
    }
    return availableMedicines!;
  }

  static List<Medicine> dummyData() {
    List<Map<String, dynamic>> dummyJson = [
      {
        'name': 'med1',
        'desc': 'dummy desc',
        'supplier': 'dummy supplier',
        'price': 10,
        'imgSrc':
            'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
      },
      {
        'name': 'med2',
        'desc': 'dummy desc - 2',
        'supplier': 'dummy supplier - 2',
        'price': 15,
        'imgSrc':
            'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
      }
    ];
    return dummyJson.map((e) => Medicine.fromJson(e)).toList();
  }
}
