import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_14_copy/feature/app/currency/pages/currency_page.dart';
import 'package:pp_14_copy/feature/app/home/pages/home_main.dart';
import 'package:pp_14_copy/feature/app/news/pages/news_page.dart';
import 'package:pp_14_copy/feature/app/settings/pages/settings_page.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false; 
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icon/home.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: SvgPicture.asset(
                'assets/icon/home.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.shadow,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icon/currency.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: SvgPicture.asset(
                'assets/icon/currency.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.shadow,
              ),
              label: 'Currency',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icon/news.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: SvgPicture.asset(
                'assets/icon/news.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.shadow,
              ),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icon/settings.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.primary,
              ),
              icon: SvgPicture.asset(
                'assets/icon/settings.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.shadow,
              ),
              label: 'Settings',
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        return const HomeMainWidget();
      case 1:
        return CurrencyPageWidget(isSettings: false);
      case 2:
        return const NewsPageWidget();
      case 3:
        return const SettingsPageWidget();
      default:
        return Container();
    }
  }
}
