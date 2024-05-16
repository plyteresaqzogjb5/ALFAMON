import 'package:flutter/material.dart';

class RowExpenseIncomeWidgets extends StatelessWidget {
  final String incomeBalance;
  final String expenceBalance;
  const RowExpenseIncomeWidgets({
    super.key,
    required this.incomeBalance,
    required this.expenceBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/expense.png'),
                    const SizedBox(height: 10),
                    Text(
                      'Expense',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      expenceBalance,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .color!
                                .withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  // Text(
                  //   expenceBalance,
                  //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //         color: Theme.of(context)
                  //             .textTheme
                  //             .titleLarge!
                  //             .color!
                  //             .withOpacity(0.5),
                  //         fontWeight: FontWeight.w400,
                  //         fontSize: 16,
                  //       ),
                  // ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/income.png'),
                    const SizedBox(height: 10),
                    Text(
                      'Income',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    incomeBalance,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .color!
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
