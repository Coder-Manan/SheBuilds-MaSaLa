class SupplierRepository {
  static Map<String, String>? suppliers;

  static Future<Map<String, String>> getSuppliers() async {
    if (suppliers == null) {
      //ping server
      return {};
    }
    return suppliers!;
  }

  static Map<String, String> dummyData() {
    return {
      'supplier 1':
          'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP',
      'supplier 2':
          'https://drive.google.com/uc?export=view&id=1L1UBld6IFUSMOT7PgbhODfYzrpDc_ojP'
    };
  }
}
