import 'package:flutter/material.dart';
import 'package:alfamon/common/models/expence.dart';
import 'package:alfamon/feature/app/home/pages/add_page.dart';
import 'package:alfamon/feature/app/home/widgets/card_container.dart';
import 'package:alfamon/feature/app/home/widgets/card_names.dart';
import 'package:alfamon/feature/app/home/widgets/card_widget.dart';

const TypeBalance _typeBalance = TypeBalance.income;

class InComeBodyWidget extends StatelessWidget {
  const InComeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            CardContainWidget(
              title: 'Income',
              cardWidget: [
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.actionolor,
                            text: CardNames.actionText,
                            pathIcon: CardNames.actionIcon,
                          ));
                    }));
                  },
                  color: CardNames.actionolor,
                  text: CardNames.actionText,
                  pathIcon: CardNames.actionIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.investColor,
                            text: CardNames.investText,
                            pathIcon: CardNames.investIcon,
                          ));
                    }));
                  },
                  color: CardNames.investColor,
                  text: CardNames.investText,
                  pathIcon: CardNames.investIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.salaryColor,
                            text: CardNames.salaryText,
                            pathIcon: CardNames.salaryIcon,
                          ));
                    }));
                  },
                  color: CardNames.salaryColor,
                  text: CardNames.salaryText,
                  pathIcon: CardNames.salaryIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.funColor,
                            text: CardNames.fundText,
                            pathIcon: CardNames.fundIcon,
                          ));
                    }));
                  },
                  color: CardNames.funColor,
                  text: CardNames.fundText,
                  pathIcon: CardNames.fundIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
