import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/home/pages/main_experence_income.dart';
import 'package:pp_14_copy/feature/app/home/widgets/card_names.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/calendar_row.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/my_balanced.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/row_expence_income.dart';
import 'package:pp_14_copy/feature/app/manual/confrim_widget.dart';
import 'package:pp_14_copy/feature/app/manual/maunal_2.dart';

class ManualMainPage extends StatefulWidget {
  const ManualMainPage({super.key});

  @override
  State<ManualMainPage> createState() => _ManualMainPageState();
}

class _ManualMainPageState extends State<ManualMainPage> {
  late OverlayEntry _overlayEntry;

  DateTime selectedDate = DateTime.now();

  double getTopPosition(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 800) {
      return 120;
    } else if (screenHeight <= 1000) {
      return 160;
    } else {
      return 180;
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
                       color: Colors.white),
                  onPressed: () {
                    _oncancel(context);
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: getTopPosition(context)),
                  SvgPicture.asset('assets/icon/manuals1.svg'),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManualSecondPage()),
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

                  // Center(
                ],
              ),
            ],
          ),
        ),
      );
    });
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



  @override
  void dispose() {
    // Удаляем OverlayEntry при удалении состояния
    _overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    const SizedBox(height: 80),
                    // Column(
                    //   children: [
                    //     const SizedBox(height: 20.0),
                    //     BalanceLineWidget(
                    //       onPressedBalance: () {},
                    //       balance: '${1000} ${0}',
                    //     )
                    //   ],
                    // ),
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
                      date:
                          DateFormat('d MMMM y', 'en_US').format(selectedDate),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MainExpenseIncomeWidget()));
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/icon/plus.svg'),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 80),
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
                color:
                    Colors.black.withOpacity(0.3), // Цвет с прозрачностью 0.5
              ),
            ),
          ),
        ],
      ),
    );
  }
}
