import 'package:flutter/material.dart';
import 'package:alfamon/feature/app/main_page.dart';
import 'package:alfamon/feature/services/network_service.dart';

class NoConnectionView extends StatelessWidget {
  NoConnectionView({super.key});

  final _networkService = NetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 1.5,
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'No internet connection.\nTry again',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16, left: 16, right: 16),
                  child: ElevatedButton(
                    onPressed: () async {
                      final isConnected =
                          await _networkService.checkConnection();
                      if (context.mounted && isConnected) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainPageWidget()));

                      }
                    },
                    child: Text('Try again'.toUpperCase()),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
