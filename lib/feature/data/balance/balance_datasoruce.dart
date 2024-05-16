import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pp_14_copy/common/models/balance.dart';

class BalanceDataSource {
  static final BalanceDataSource _instance = BalanceDataSource._internal();

  factory BalanceDataSource() {
    return _instance;
  }

  BalanceDataSource._internal();

  Future<int?> insertBalance(Balance balance) async {
    
    try {
      var box = await Hive.openBox<Balance>('balanceBox');

      final existingBalance = await getBalance();

      if (existingBalance != null) {
        var updateBalance = Balance(
            price: balance.price += existingBalance.price,
            currency: balance.currency);
        await box.putAt(0, updateBalance);
        // await box.deleteAt(0);
      } else {
        // await box.deleteAt(0);
        await box.add(balance);
      }

      await box.close();
      return 0;
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting/updating balance: $e');
      }
      return null;
    }
  }

  Future<Balance?> getBalance() async {
    try {
      var box = await Hive.openBox<Balance>('balanceBox');
      if (box.isNotEmpty) {
        final balance = box.getAt(0);
        return balance;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
