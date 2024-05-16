import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/home/widgets/card_names.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/balance_line.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/calendar_row.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/my_balanced.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/row_expence_income.dart';
import 'package:pp_14_copy/feature/app/manual/confrim_widget.dart';
import 'package:pp_14_copy/feature/app/manual/maunal_3.dart';

class ManualSecondPage extends StatefulWidget {
  const ManualSecondPage({super.key});

  @override
  State<ManualSecondPage> createState() => _ManualSecondPageState();
}

class _ManualSecondPageState extends State<ManualSecondPage> {
   late OverlayEntry _overlayEntry;

  DateTime selectedDate = DateTime.now();

  double getTopPosition(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 800) {
      return 120;
    } else if (screenHeight <= 1000) {
      return 140;
    } else {
      return 160;
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
                  _oncancel(context);
                  
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManualThreePage()),
                    );
                    _overlayEntry.remove();
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

                const SizedBox(height: 40),

                Center(
                    child: Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: SvgPicture.asset('assets/icon/maunals2.svg'))),
                SizedBox(height: getTopPosition(context)), // Center(
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
_oncancel(BuildContext context) {
  _overlayEntry.remove();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationDialog(
        onPressed: () {
          Navigator.of(context).pop();

          _overlayEntry = _creayeOverlayEntry();
          // Добавляем OverlayEntry в Overlay при построении виджета
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Overlay.of(context).insert(_overlayEntry);
          });
        },
        theme: Theme.of(context),
      );
    },
  );
}

  // late final OverlayEntry _overlayEntry;

  // DateTime selectedDate = DateTime.now();

  // @override
  // void initState() {
  //   _overlayEntry = OverlayEntry(builder: (context) {
  //     return IgnorePointer(
  //     ignoring: true,
  //       child: Stack(
  //         children: [
  //            Positioned(
  //             top: 0.03 * MediaQuery.of(context).size.height,
  //             width: MediaQuery.of(context).size.width,
  //               child: Center(
  //                 child: Padding(
  //                   padding: EdgeInsets.only(top: 540, right: 20),
  //                   child: CupertinoButton(
  //                     padding: EdgeInsets.zero,
  //                     onPressed: () {},
  //                     child: Container(
  //                       height: 48,
  //                       width: 48,
  //                       decoration: BoxDecoration(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(12)),
  //                         color: Theme.of(context).colorScheme.primary,
  //                       ),
  //                       child: Center(
  //                         child: SvgPicture.asset('assets/icon/plus.svg'),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           Positioned(
  //               top: 0.66 * MediaQuery.of(context).size.height,
  //               left: 70,
  //               child: SvgPicture.asset('assets/icon/line_manual2.svg')),
  //           Positioned(
  //             top: 0.62 * MediaQuery.of(context).size.height,
  //             right: 20,
  //             child: Container(
  //               width: 0.65 * MediaQuery.of(context).size.width,
  //               child: Card(
  //                 color: Theme.of(context).colorScheme.primary,
  //                 // padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
  //                 child: Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
  //                   child: Text(
  //                     'Track your income\nand expenses',
  //                     textAlign: TextAlign.center,
  //                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                         color: Theme.of(context).colorScheme.onSecondary,
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w500),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //               top: 350,
  //               right: 110,
  //               child: ElevatedButton(
  //                 style: ButtonStyle(
  //                   backgroundColor:
  //                       MaterialStateProperty.all<Color>(Colors.transparent),
  //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                     RoundedRectangleBorder(
  //                       side: BorderSide(color: Colors.white, width: 1),
  //                       borderRadius:
  //                           BorderRadius.circular(47), // Радиус скругления углов
  //                     ),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                     Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) =>
  //                                   const ManualThreePage()));
  //                                    _overlayEntry.remove();

  //                 },
  //                 child: Text(
  //                   'ok',
  //                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                       color: Theme.of(context).colorScheme.onSecondary,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //               )),
  //         ],
  //       ),
  //     );
  //   });
  //   // Добавляем OverlayEntry в Overlay при построении виджета
  //   WidgetsBinding.instance?.addPostFrameCallback((_) {
  //     Overlay.of(context)?.insert(_overlayEntry);
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // Удаляем OverlayEntry при удалении состояния
  //   _overlayEntry.remove();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                toolbarHeight: 30.0,
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeConfig.marginHoriontal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalendarRowWidgets(
                          date: DateFormat('d MMMM y', 'en_US')
                              .format(selectedDate),
                          onPressedCalendar: () {}),
                      // SizedBox(height: 80),
                      Column(
                        children: [
                          const SizedBox(height: 20.0),
                          BalanceLineWidget(
                            onPressedBalance: () {},
                            balance: '${1000} ${0}',
                            typeBalance: 'USD',
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const RowExpenseIncomeWidgets(
                        expenceBalance: '400',
                        incomeBalance: '1000',
                      ),
                      MyBalancedCardWidget(
                        expence: [
                          Expence(
                              price: '600',
                              currency: '1',
                              date: DateTime.now().toString(),
                              icon: CardNames.healthIcon,
                              color: '0xFFF84A13',
                              title: CardNames.healthText,
                              type: TypeBalance.expence)
                        ],
                        date: DateFormat('d MMMM y', 'en_US')
                            .format(selectedDate),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      // CupertinoButton(
                      //   padding: EdgeInsets.zero,
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const MainExpenseIncomeWidget()));
                      //   },
                      //   child: Container(
                      //     height: 48,
                      //     width: 48,
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(12)),
                      //       color: Theme.of(context).colorScheme.primary,
                      //     ),
                      //     child: Center(
                      //       child: SvgPicture.asset('assets/icon/plus.svg'),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 5, sigmaY: 5), // Размытие с силой 5
                child: Container(
                  color:
                      Colors.black.withOpacity(0.3), // Цвет с прозрачностью 0.5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
