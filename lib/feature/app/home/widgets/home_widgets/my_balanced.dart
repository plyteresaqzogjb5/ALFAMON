import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBalancedCardWidget extends StatefulWidget {
  final String date;
  final List expence;
  const MyBalancedCardWidget(
      {super.key, required this.date, required this.expence});

  @override
  State<MyBalancedCardWidget> createState() => _MyBalancedCardWidgetState();
}

class _MyBalancedCardWidgetState extends State<MyBalancedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.date,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
              itemCount: widget.expence.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MyBalancedContainer(
                  pathIcon: widget.expence[index].icon,
                  title: widget.expence[index].title,
                  price: widget.expence[index].price,
                  typeBalance: widget.expence[index].currency,
                  color: Color(int.parse(widget.expence[index].color)),
                );
              })
        ],
      ),
    );
  }
}

class MyBalancedContainer extends StatelessWidget {
  final String pathIcon;
  final String title;
  final Color color;
  final String price;
  final String typeBalance;

  const MyBalancedContainer(
      {super.key,
      required this.pathIcon,
      required this.color,
      required this.title,
      required this.typeBalance,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: SvgPicture.asset(
                    pathIcon,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
              )
            ],
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    price,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                  ),
                ),
                Flexible(
                  child: Text(
                    typeBalance,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                  ),
                ),
              ],
            ),
          )
          // Text(
          //   price,
          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //         fontWeight: FontWeight.w400,
          //         fontSize: 16,
          //         color: Theme.of(context)
          //             .colorScheme
          //             .onBackground
          //             .withOpacity(0.5),
          //       ),
          // ),
        ],
      ),
    );
  }
}
