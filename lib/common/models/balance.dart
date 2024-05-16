import 'package:hive/hive.dart';

class Balance extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  double price;

  @HiveField(2)
  String currency;

  Balance({
    this.id,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': 1,
      'currency': currency,
      'price': price,
    };
  }

  factory Balance.fromMap(Map<String, dynamic> map) {
    return Balance(
      id: 1,
      price: map['price'] as double,
      currency: map['currency'] as String,
    );
  }
}
