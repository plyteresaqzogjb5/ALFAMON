import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:alfamon/common/components/fields/number_fields.dart';
import 'package:alfamon/common/helpers/show_custom_snack_bar.dart';
import 'package:alfamon/common/models/expence.dart';
import 'package:alfamon/common/styles/const_theme/size.dart';
import 'package:alfamon/feature/app/currency/pages/currency_page.dart';
import 'package:alfamon/feature/app/home/add_bloc/add_bloc_bloc.dart';

import 'package:alfamon/feature/app/home/widgets/card_widget.dart';
import 'package:alfamon/feature/app/main_page.dart';

class AddBalanceScreenWidget extends StatefulWidget {
  final TypeBalance typeBalance;
  final CardWidget cardtype;
  const AddBalanceScreenWidget({
    super.key,
    required this.cardtype,
    required this.typeBalance,
  });

  @override
  State<AddBalanceScreenWidget> createState() => _AddBalanceScreenWidgetState();
}

class _AddBalanceScreenWidgetState extends State<AddBalanceScreenWidget> {
  late TextEditingController controller;
 DateTime selectedDate = DateTime.now().add(const Duration(hours: 1));

  String? inSelectedCurrency;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBloc, AddBlocState>(
      listener: (context, state) {
        if (state is CreatedExpence || state is CreatedIncome) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPageWidget()));
        } else if (state is AddError) {
          if (kDebugMode) {
            print(state.failure.message);
          }
          showCustomSnackBar(context, state.failure.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            double? value = double.tryParse(controller.text);

                            if (value != null && value > 0) {
                              BlocProvider.of<AddBloc>(context)
                                  .add(CreateExpenceEvent(
                                      expence: Expence(
                                price: controller.text,
                                currency: inSelectedCurrency != null
                                    ? inSelectedCurrency!
                                    : 'USD',
                                date: selectedDate.toString(),
                                icon: widget.cardtype.pathIcon,
                                color: '${widget.cardtype.color.value}',
                                title: widget.cardtype.text,
                                type: widget.typeBalance,
                              )));
                              // Navigator.pop(context);
                            } else {}
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  title: Text(
                                    'No Amount Entered',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 20),
                                  ),
                                  content: Text('Please enter an amount.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: Text('OK',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Add',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: controller.text.isNotEmpty
                                        ? Theme.of(context).colorScheme.primary
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
                                        selectedDate = newDate.add(const Duration(hours: 1));
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
                          controller: controller,
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
                                  onCurrencySelected: (selectedCurrency) {
                                    setState(() {
                                      inSelectedCurrency =
                                          selectedCurrency.name ?? '';
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
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: Center(
                              child: Text(
                                inSelectedCurrency ?? 'USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
