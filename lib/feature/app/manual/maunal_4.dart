import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:alfamon/common/components/fields/number_fields.dart';

import 'package:alfamon/common/styles/const_theme/size.dart';
import 'package:alfamon/feature/app/currency/pages/currency_page.dart';
import 'package:alfamon/feature/app/main_page.dart';


class ManualFourPage extends StatefulWidget {
  const ManualFourPage({super.key});

  @override
  State<ManualFourPage> createState() => _ManualFourPageState();
}

class _ManualFourPageState extends State<ManualFourPage> {
  late OverlayEntry _overlayEntry;

  DateTime selectedDate = DateTime.now();

  double getTopPosition(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 800) {
      return 160;
    } else if (screenHeight <= 1000) {
      return 180;
    } else {
      return 200;
    }
  }

  @override
  void initState() {
    _overlayEntry = _creayeOverlayEntry();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });
    super.initState();
  }

  OverlayEntry _creayeOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width * 1,
          child: Stack(
            children: [
              Positioned(
                top: 80,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white,),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPageWidget(),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: getTopPosition(context)),
                  SvgPicture.asset('assets/icon/maunals4.svg'),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                     
                        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPageWidget(),
                      ),
                    );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(47),
                        ),
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),

                  // Center(
                ],
              ),
            ],
          ),
        ),
      );
    });
  }



  @override
  void dispose() {
    // Удаляем OverlayEntry при удалении состояния
    _overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeConfig.marginHoriontal, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(13)),
              ),
              width: double.infinity,
              // height: 270,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                      height: 1, color: Theme.of(context).colorScheme.shadow),
                  const SizedBox(height: 10),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext builderContext) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(39),
                                topRight: Radius.circular(39),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  padding: const EdgeInsets.only(
                                      right: 30, top: 20, bottom: 15),
                                  child: const Text(
                                    'Ok',
                                    style: TextStyle(
                                      // Использование явного стиля текста
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Expanded(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: selectedDate,
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(() {
                                        selectedDate =
                                            newDate.add(const Duration(hours: 1));
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Text(
                        DateFormat('dd.MM.yyyy').format(selectedDate),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.6),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                      height: 1, color: Theme.of(context).colorScheme.shadow),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: NumberFieldWidget(
                          controller: TextEditingController(),
                          titleHint: '0',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CurrencyPageWidget(
                                  isSettings: true,
                                  onCurrencySelected: (selectedCurrency) {},
                                ),
                              ),
                            );
                          },
                          child: Container(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Размытие с силой 5
            child: Container(
              color: Colors.black.withOpacity(0.3), // Цвет с прозрачностью 0.5
            ),
          ),
        ),
      ],
    );
  }
}
