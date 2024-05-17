import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alfamon/common/components/custom_bottom_sheet.dart';
import 'package:alfamon/common/components/fields/number_fields.dart';
import 'package:alfamon/common/helpers/dialog_helper.dart';
import 'package:alfamon/common/helpers/show_custom_snack_bar.dart';
import 'package:alfamon/common/models/balance.dart';
import 'package:alfamon/common/models/coin.dart';
import 'package:alfamon/common/styles/bloc/styles_bloc.dart';

import 'package:alfamon/common/styles/const_theme/size.dart';
import 'package:alfamon/feature/app/currency/pages/currency_page.dart';
import 'package:alfamon/feature/app/home/home_bloc/home_bloc.dart';
import 'package:alfamon/feature/app/settings/bloc/settings_bloc.dart';
import 'package:alfamon/feature/app/settings/pages/contact_us_page.dart';
import 'package:alfamon/feature/app/settings/pages/privacy_page.dart';
import 'package:alfamon/feature/app/settings/pages/terms_page.dart';
import 'package:alfamon/feature/app/settings/widgets/containers.dart';
import 'package:alfamon/feature/app/settings/widgets/rate_us.dart';
import 'package:alfamon/feature/app/settings/widgets/theme_changed.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  late TextEditingController controller;
  Coin? inSelectedCurrency;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is BalancedLoaded) {
          if (kDebugMode) {
            print('ok');
          }
        } else if (state is SettingsError) {
          if (kDebugMode) {
            print(state.failure.message);
          }
          showCustomSnackBar(context, state.failure.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(toolbarHeight: 30.0, automaticallyImplyLeading: false),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeConfig.marginHoriontal),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ContainerChangedThemeWidget(),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SettingsContainer(
                          onPressed: () {
                           BlocProvider.of<StylesBloc>(context).add(GetStylesEvent());
                            showRateUsDialog(context, Theme.of(context));
                          },
                          pathIcon: 'assets/images/rate_us.png',
                          title: 'Rate us',
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Divider(
                                height: 1,
                                color: Theme.of(context).colorScheme.shadow)),
                        SettingsContainer(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ContactUsPageWidget()));
                          },
                          pathIcon: 'assets/images/contact.png',
                          title: 'Contact',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SettingsContainer(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPagesWidget()));
                          },
                          pathIcon: 'assets/images/privacy_policy.png',
                          title: 'Privacy Policy',
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Divider(
                                height: 1,
                                color: Theme.of(context).colorScheme.shadow)),
                        SettingsContainer(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsPagesWidget()));
                          },
                          pathIcon: 'assets/images/terms_of_use.png',
                          title: 'Terms of Use',
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Divider(
                                height: 1,
                                color: Theme.of(context).colorScheme.shadow)),
                        SettingsContainer(
                          onPressed: () =>
                              DialogHelper.showAppVersionDialog(context),
                          pathIcon: 'assets/images/version.png',
                          title: 'Application version',
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Divider(
                                height: 1,
                                color: Theme.of(context).colorScheme.shadow)),
                        SettingsContainer(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color:
                                                        controller.text.isEmpty
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .titleLarge!
                                                                .color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (controller.text.isNotEmpty) {
                                                double? value = double.tryParse(
                                                    controller.text);
                                      
                                                if (value != null &&
                                                    value > 0) {
                                                  BlocProvider.of<SettingsBloc>(
                                                          context)
                                                      .add(CreateBalanceEvent(
                                                          balance: Balance(
                                                    price:  
                                                    double.parse(
                                                        controller.text),
                                                    currency: inSelectedCurrency
                                                                ?.symbol !=
                                                            null
                                                        ? '${inSelectedCurrency!.symbol}'
                                                        : "USD",
                                                  )));
                                                  Navigator.pop(context);
                                                } else {}
                                              } else {}
                                            },
                                            child: Text(
                                              'Add',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color: controller
                                                            .text.isNotEmpty
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .titleLarge!
                                                            .color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15.0),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: NumberFieldWidget(
                                              controller: controller,
                                              titleHint: '0',
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            child: CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CurrencyPageWidget(
                                                      isSettings: true,
                                                      onCurrencySelected:
                                                          (selectedCurrency) {
                                                        setState(() {
                                                          inSelectedCurrency =
                                                              selectedCurrency;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 51,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    inSelectedCurrency
                                                            ?.symbol ??
                                                        'USD',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(height: 10.0),
                                    ],
                                  ),
                                );
                              },
                            ).then((value) {
                              setState(() {
                                controller.clear();
                              });
                            });
                          },
                          pathIcon: 'assets/images/saver.png',
                          title: 'Saver',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
