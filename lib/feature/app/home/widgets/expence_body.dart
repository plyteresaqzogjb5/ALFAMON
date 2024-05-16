import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/feature/app/home/pages/add_page.dart';
import 'package:pp_14_copy/feature/app/home/widgets/card_container.dart';
import 'package:pp_14_copy/feature/app/home/widgets/card_names.dart';
import 'package:pp_14_copy/feature/app/home/widgets/card_widget.dart';

const TypeBalance _typeBalance = TypeBalance.expence;

class ExpenceBodyWidget extends StatelessWidget {
  final bool isMaunal;

  const ExpenceBodyWidget(this.isMaunal, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            CardContainWidget(
              title: 'Recently used',
              cardWidget: [
                isMaunal 
                    ?  const SizedBox(height: 45) : CardWidget(
                        onpressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AddBalanceScreenWidget(
                                typeBalance: _typeBalance,
                                cardtype: CardWidget(
                                  color: CardNames.healthColor,
                                  text: CardNames.healthText,
                                  pathIcon: CardNames.healthIcon,
                                ));
                          }));
                        },
                        color: CardNames.healthColor,
                        text: CardNames.healthText,
                        pathIcon: CardNames.healthIcon,
                      )
                    
              ],
            ),
            CardContainWidget(
              title: 'Every day',
              cardWidget: [
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.socialColor,
                            text: CardNames.socialText,
                            pathIcon: CardNames.socialIcon,
                          ));
                    }));
                  },
                  color: CardNames.socialColor,
                  text: CardNames.socialText,
                  pathIcon: CardNames.socialIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.transportColor,
                            text: CardNames.transportText,
                            pathIcon: CardNames.transportIcon,
                          ));
                    }));
                  },
                  color: CardNames.transportColor,
                  text: CardNames.transportText,
                  pathIcon: CardNames.transportIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.phoneColor,
                            text: CardNames.phoneText,
                            pathIcon: CardNames.phoneIcon,
                          ));
                    }));
                  },
                  color: CardNames.phoneColor,
                  text: CardNames.phoneText,
                  pathIcon: CardNames.phoneIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.healthColor,
                            text: CardNames.healthText,
                            pathIcon: CardNames.healthIcon,
                          ));
                    }));
                  },
                  color: CardNames.healthColor,
                  text: CardNames.healthText,
                  pathIcon: CardNames.healthIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.buyingColor,
                            text: CardNames.buyingText,
                            pathIcon: CardNames.buyingIcon,
                          ));
                    }));
                  },
                  color: CardNames.buyingColor,
                  text: CardNames.buyingText,
                  pathIcon: CardNames.buyingIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.maintenanceColor,
                            text: CardNames.maintenanceText,
                            pathIcon: CardNames.maintenanceIcon,
                          ));
                    }));
                  },
                  color: CardNames.maintenanceColor,
                  text: CardNames.maintenanceText,
                  pathIcon: CardNames.maintenanceIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.foodColor,
                            text: CardNames.foodText,
                            pathIcon: CardNames.foodIcon,
                          ));
                    }));
                  },
                  color: CardNames.foodColor,
                  text: CardNames.foodText,
                  pathIcon: CardNames.foodIcon,
                ),
              ],
            ),
            CardContainWidget(
              title: 'Actions',
              cardWidget: [
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.officeColor,
                            text: CardNames.officeText,
                            pathIcon: CardNames.officeIcon,
                          ));
                    }));
                  },
                  color: CardNames.officeColor,
                  text: CardNames.officeText,
                  pathIcon: CardNames.officeIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.educationColor,
                            text: CardNames.educationText,
                            pathIcon: CardNames.educationIcon,
                          ));
                    }));
                  },
                  color: CardNames.educationColor,
                  text: CardNames.educationText,
                  pathIcon: CardNames.educationIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.travelColor,
                            text: CardNames.travelText,
                            pathIcon: CardNames.travelIcon,
                          ));
                    }));
                  },
                  color: CardNames.travelColor,
                  text: CardNames.travelText,
                  pathIcon: CardNames.travelIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.sportColor,
                            text: CardNames.sportText,
                            pathIcon: CardNames.sportIcon,
                          ));
                    }));
                  },
                  color: CardNames.sportColor,
                  text: CardNames.sportText,
                  pathIcon: CardNames.sportIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.funColor,
                            text: CardNames.funText,
                            pathIcon: CardNames.funIcon,
                          ));
                    }));
                  },
                  color: CardNames.funColor,
                  text: CardNames.funText,
                  pathIcon: CardNames.funIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.parkColor,
                            text: CardNames.parkText,
                            pathIcon: CardNames.parkIcon,
                          ));
                    }));
                  },
                  color: CardNames.parkColor,
                  text: CardNames.parkText,
                  pathIcon: CardNames.parkIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.workColor,
                            text: CardNames.workText,
                            pathIcon: CardNames.workIcon,
                          ));
                    }));
                  },
                  color: CardNames.workColor,
                  text: CardNames.workText,
                  pathIcon: CardNames.workIcon,
                ),
              ],
            ),
            CardContainWidget(
              title: 'Every day',
              cardWidget: [
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.socialColor,
                            text: CardNames.socialText,
                            pathIcon: CardNames.socialIcon,
                          ));
                    }));
                  },
                  color: CardNames.socialColor,
                  text: CardNames.socialText,
                  pathIcon: CardNames.socialIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.transportColor,
                            text: CardNames.transportText,
                            pathIcon: CardNames.transportIcon,
                          ));
                    }));
                  },
                  color: CardNames.transportColor,
                  text: CardNames.transportText,
                  pathIcon: CardNames.transportIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.phoneColor,
                            text: CardNames.phoneText,
                            pathIcon: CardNames.phoneIcon,
                          ));
                    }));
                  },
                  color: CardNames.phoneColor,
                  text: CardNames.phoneText,
                  pathIcon: CardNames.phoneIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.healthColor,
                            text: CardNames.healthText,
                            pathIcon: CardNames.healthIcon,
                          ));
                    }));
                  },
                  color: CardNames.healthColor,
                  text: CardNames.healthText,
                  pathIcon: CardNames.healthIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.buyingColor,
                            text: CardNames.buyingText,
                            pathIcon: CardNames.buyingIcon,
                          ));
                    }));
                  },
                  color: CardNames.buyingColor,
                  text: CardNames.buyingText,
                  pathIcon: CardNames.buyingIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.maintenanceColor,
                            text: CardNames.maintenanceText,
                            pathIcon: CardNames.maintenanceIcon,
                          ));
                    }));
                  },
                  color: CardNames.maintenanceColor,
                  text: CardNames.maintenanceText,
                  pathIcon: CardNames.maintenanceIcon,
                ),
                CardWidget(
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddBalanceScreenWidget(
                          typeBalance: _typeBalance,
                          cardtype: CardWidget(
                            color: CardNames.foodColor,
                            text: CardNames.foodText,
                            pathIcon: CardNames.foodIcon,
                          ));
                    }));
                  },
                  color: CardNames.foodColor,
                  text: CardNames.foodText,
                  pathIcon: CardNames.foodIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
