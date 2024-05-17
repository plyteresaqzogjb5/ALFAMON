import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:alfamon/common/models/coin.dart';

class CurrencyDataSource {
  Future<List<Coin>> getListCuurency() async {
    final response = await http.get(
      Uri.parse('https://coinranking1.p.rapidapi.com/coins'),
      headers: {
        'X-RapidAPI-Key': '46cbee0cc4msh7a4a161f7806e17p11ecb7jsn9dd4facdf0da',
        'X-RapidAPI-Host': 'coinranking1.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> coinsList = data['data']['coins'];
      return coinsList.map((json) => Coin.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load coins');
    }
  }
}
