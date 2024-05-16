// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:pp_14_copy/common/models/balance.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/home/home_bloc/home_bloc.dart';
import 'package:pp_14_copy/feature/app/home/pages/main_experence_income.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/balance_line.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/calendar_row.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/my_balanced.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/not_avialable.dart';
import 'package:pp_14_copy/feature/app/home/widgets/home_widgets/row_expence_income.dart';

class HomeMainWidget extends StatefulWidget {
  final bool? manual;
  const HomeMainWidget({
    super.key,
    this.manual,
  });

  @override
  State<HomeMainWidget> createState() => _HomeMainWidgetState();
}

class _HomeMainWidgetState extends State<HomeMainWidget> {
  DateTime selectedDate = DateTime.now();
  Balance? mybalance;
  List? dateByDate;
  List<double> totalAmount = [];
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetBalanceEvent());
    BlocProvider.of<HomeBloc>(context).add(GetByDateEvent(date: selectedDate));
    BlocProvider.of<HomeBloc>(context).add(GetTotalAmountEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is BalancedLoaded) {
           if (kDebugMode) {
            print(state.balance.price);
          }
          setState(() {
              mybalance = state.balance;
           });
        } else if (state is ByDateLoaded) {
          dateByDate = state.responsed;
        } else if (state is TotalAmountLoaded) {
          // setState(() {
          totalAmount = state.responsed;
          // });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 30.0,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            physics: dateByDate != null
                ? dateByDate!.isNotEmpty
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SizeConfig.marginHoriontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalendarRowWidgets(
                      date:
                          DateFormat('d MMMM y', 'en_US').format(selectedDate),
                      onPressedCalendar: () {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CupertinoButton(
                                    padding: const EdgeInsets.only(
                                        right: 30, top: 20, bottom: 15),
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(
                                        
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onPressed: () {
                                   
                                    
                                      BlocProvider.of<HomeBloc>(context).add(
                                          GetByDateEvent(date: selectedDate));
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: selectedDate,
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() {
                                          selectedDate = newDate;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                  if (mybalance != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: BalanceLineWidget(
                        onPressedBalance: () {},
                        balance: '${mybalance!.price} ',
                        typeBalance: mybalance!.currency,
                      ),
                    ),
                  const SizedBox(height: 20),
                  RowExpenseIncomeWidgets(
                    expenceBalance:
                        totalAmount.isNotEmpty ? '${totalAmount[1]}' : '0',
                    incomeBalance:
                        totalAmount.isNotEmpty ? '${totalAmount[0]}' : '0',
                  ),
                  if (dateByDate == null)
                    NotAvialableAddButtonWidget(onpressed: () {}),
                  if (dateByDate != null)
                    MyBalancedCardWidget(
                      expence: dateByDate!,
                      date:
                          DateFormat('d MMMM y', 'en_US').format(selectedDate),
                    ),
                  SizedBox(height: dateByDate != null ? 0 : 80),
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
                  SizedBox(height: dateByDate != null ? 80 : 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
