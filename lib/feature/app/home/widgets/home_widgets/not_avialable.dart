import 'package:flutter/material.dart';

class NotAvialableAddButtonWidget extends StatelessWidget {
  final Function() onpressed;
  const NotAvialableAddButtonWidget({
    super.key,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 90),
        Center(child: Image.asset('assets/images/not_available.png')),
        const SizedBox(height: 10),
        Text(
          'Data is not yet available',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.shadow,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
