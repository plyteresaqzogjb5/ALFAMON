import 'package:flutter/material.dart';

class CardContainWidget extends StatelessWidget {
  final List<dynamic> cardWidget;
  final String title;

  const CardContainWidget({
    super.key,
    required this.cardWidget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 17),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 15),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
          ),
          const SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 0,
            runSpacing: 22.0,
            children: cardWidget.map((card) {
              return SizedBox(
                width: 72, 
                child: card,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
