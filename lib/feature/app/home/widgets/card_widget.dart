import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  final Color color;
  final String text;
  final String pathIcon;
  Function()? onpressed;

  CardWidget({
    super.key,
    required this.color,
    required this.text,
    required this.pathIcon,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onpressed,
      child: SizedBox(
        width: 95,
        child: Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  pathIcon,
                 
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .color!
                        .withOpacity(0.8),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
