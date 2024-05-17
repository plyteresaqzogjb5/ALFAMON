import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:alfamon/common/models/balance.dart';
import 'package:alfamon/common/models/expence.dart';

class ExpenceDataSource {
  static final ExpenceDataSource _instance = ExpenceDataSource._internal();

  factory ExpenceDataSource() {
    return _instance;
  }

  ExpenceDataSource._internal();

  Future<int?> insertExpence(Expence expence) async {
      
      try {
      // Получаем текущий баланс
      var balanceBox = await Hive.openBox<Balance>('balanceBox');
      Balance? currentBalance;

      // Проверяем, есть ли элемент с индексом 0 в коробке
      if (balanceBox.isNotEmpty) {
        currentBalance = balanceBox.getAt(0);
      }

      // Если баланс не существует, создаем его с нулевым значением
      if (currentBalance == null) {
        currentBalance = Balance(price: 0, currency: '');
        await balanceBox.add(currentBalance);
      }
      // Преобразуем цену расхода в число и вычитаем из текущего баланса
      double expenceAmount = double.parse(expence.price);
      currentBalance.price -= expenceAmount;

      // Обновляем текущий баланс
      await balanceBox.putAt(0, currentBalance);
      await balanceBox.close();

      // Добавляем новый расход
      var expenceBox = await Hive.openBox<Expence>('expenceBox');
      int index = await expenceBox.add(expence);
      await expenceBox.close();

      return index;
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting/updating expence: $e');
      }
      return null;
    }
  }

  Future<List<Expence>> getExpences(DateTime date) async {

    try {
      
      var box = await Hive.openBox<Expence>('expenceBox');
      List<Expence> expences = [];

      DateTime startDate = DateTime(date.year, date.month, date.day);
      DateTime endDate = startDate.add(const Duration(days: 1));

      for (int i = 0; i < box.length; i++) {
        if (box.containsKey(i)) {
          
        
          Expence expence = box.getAt(i)!;
        
          DateTime expenceDate = DateTime.parse(expence.date);
        
          if (expenceDate.isAfter(startDate) && expenceDate.isBefore(endDate)) {
          
            expences.add(expence);
          }
        }
      }
      return expences;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching expences: $e');
      }
      return [];
    }
  }

  Future<List<double>> getTotalAmounts() async {
    try {
      var box = await Hive.openBox<Expence>('expenceBox');
      List<double> amounts = [0, 0];
      // 1 index: income , 2 index: expence
      for (int i = 0; i < box.length; i++) {
        Expence expence = box.getAt(i)!;
        if (expence.type == TypeBalance.income) {
          amounts[0] += double.parse(expence.price);
        } else {
          amounts[1] += double.parse(expence.price);
        }
      }

      // await box.close();

      return amounts;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching total amounts: $e');
      }
      return [0, 0];
    }
  }
}
