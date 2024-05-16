// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

class Expence extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String price;

  @HiveField(2)
  String currency;

  @HiveField(3)
  String date;

  @HiveField(4)
  String icon;

  @HiveField(5)
  String color;

  @HiveField(6)
  String title;

  @HiveField(7)
  TypeBalance type;

  Expence({
    this.id,
    required this.price,
    required this.currency,
    required this.date,
    required this.icon,
    required this.color,
    required this.title,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'currency': currency,
      'date': date,
      'icon': icon,
      'color': color,
      'title': title,
      'type': type,
    };
  }

  factory Expence.fromMap(Map<String, dynamic> map) {
    return Expence(
      id: map['id'] != null ? map['id'] as int : null,
      price: map['price'] as String,
      currency: map['currency'] as String,
      date: map['date'] as String,
      icon: map['icon'] as String,
      color: map['color'] as String,
      title: map['title'] as String,
      type: map['type'] as TypeBalance,
    );
  }
}

enum TypeBalance { income, expence }
