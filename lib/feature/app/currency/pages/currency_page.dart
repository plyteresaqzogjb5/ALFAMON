// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_14_copy/common/helpers/show_custom_snack_bar.dart';
import 'package:pp_14_copy/common/models/coin.dart';

import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/currency/bloc/currency_bloc.dart';

// ignore: must_be_immutable
class CurrencyPageWidget extends StatefulWidget {
  Function(Coin)? onCurrencySelected;
  CurrencyPageWidget({
    super.key,
    required this.isSettings,
    this.onCurrencySelected,
  });
  final bool isSettings;
  @override
  State<CurrencyPageWidget> createState() => _CurrencyPageWidgetState();
}

class _CurrencyPageWidgetState extends State<CurrencyPageWidget> {
  List<Coin> currencyList = [];
  @override
  void initState() {
    BlocProvider.of<CurrencyBloc>(context).add(GetListCoinEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyBloc, CurrencyState>(
      listener: (context, state) {
        if (state is CoinlLoaded) {
          setState(() {
            currencyList = state.responsed;
          });
        } else if (state is CoinError) {
          showCustomSnackBar(context, state.failure.message);
        } else if (state is CoinlLoading) {
          setState(() {
            currencyList = [];
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 30.0,
            automaticallyImplyLeading: widget.isSettings,
          ),
          body: state is CoinlLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.marginHoriontal,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: currencyList.length,
                            itemBuilder: (context, index) {
                              return !widget.isSettings
                                  ? CurrencyContainerWidget(
                                      currency: currencyList[index])
                                  : CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: CurrencyContainerWidget(
                                          currency: currencyList[index]),
                                      onPressed: () {
                                        if (widget.onCurrencySelected != null) {
                                          widget.onCurrencySelected!(
                                              currencyList[index]);
                                        }
                                        Navigator.pop(context);
                                      });
                            }),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class CurrencyContainerWidget extends StatelessWidget {
  final Coin currency;
  const CurrencyContainerWidget({
    super.key,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            currency.symbol ?? '',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            currency.price != null ? double.tryParse('${currency.price}')!.toStringAsFixed(2).toString()  : '',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
