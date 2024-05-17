import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/feature/services/injection.dart';
import 'package:alfamon/feature/services/remote_config_service.dart';

class NewsDataSource {
  final _remoteConfigService = sl.get<RemoteConfigService>();
  static const String _apiHost = 'newsapi.org';
  static const String _apiPath = '/v2/everything';

  Future<List<News>> _getNews(String query) async {
    final String apiKey = _remoteConfigService.getString(ConfigKey.newsApiKey);

    final response = await http.get(
      Uri.https(_apiHost, _apiPath,
          {'q': query, 'apiKey': apiKey, 'pageSize': "10"}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['articles'];
      final List<News> newsList =
          responseData.map((json) => News.fromJson(json)).toList();
      return newsList;
    } else {
      throw InvalidDataFailure(message: 'Failed to load news');
    }
  }

  Future<List<News>> getNewsTipsforTravel() async {
    return _getNews('Trips');
  }

  Future<List<News>> getNewsCountriesforTraveling() async {
    return _getNews('Travel');
  }
}

// class NewsDataSource {
//   final _remoteConfigService = sl.get<RemoteConfigService>();
//   static const String _apiHost = 'google-api31.p.rapidapi.com';
//   static const String _apiUrl = 'https://newsapi.org/v2/everything';

//   Future<List<News>> _getNews(String text) async {
//     final response = await http.get(
//       Uri.parse("https://newsapi.org/v2/everything?q=$text&apiKey=0f46750a33824f9e9c9face2c29dc01d"),
//     );
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       final List<dynamic> responseData = json.decode(response.body)['articles'];
//       final List<News> newsList =
//           responseData.map((json) => News.fromJson(json)).toList();
//        return newsList;
//     } else {
//       throw InvalidDataFailure(message: 'Failed to load news');
//     }
//   }

//   Future<List<News>> getNewsTipsforTravel() async {
//     return _getNews('Trips');
//   }

//   Future<List<News>> getNewsCountriesforTraveling() async {
//     return _getNews('Travel');
//   }
// }
// class NewsDataSource {
//   final _remoteConfigService = sl.get<RemoteConfigService>();
//   static const String _apiHost = 'google-api31.p.rapidapi.com';
//   static const String _apiUrl = 'https://google-api31.p.rapidapi.com/';

//   Future<List<News>> _getNews(String text) async {
//     final response = await http.post(
//       Uri.parse(_apiUrl),
//       headers: {
//         'content-type': 'application/json',
//         'X-RapidAPI-Key': _remoteConfigService.getString(ConfigKey.newsApiKey),
//         'X-RapidAPI-Host': _apiHost,
//       },
//       body: json.encode({
//         'text': text,
//         'max_results': 10,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body)['news'];
//       final List<News> newsList =
//           responseData.map((json) => News.fromJson(json)).toList();
//       return newsList;
//     } else {
//       throw InvalidDataFailure(message: 'Failed to load news');
//     }
//   }

//   Future<List<News>> getNewsTipsforTravel() async {
//     return _getNews('Trips');
//   }

//   Future<List<News>> getNewsCountriesforTraveling() async {
//     return _getNews('Travel');
//   }
// }
