import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onPressed;
  bool? isBackButton;
  CustomAppbar({
    super.key,
    required this.title,
    this.onPressed,
    this.isBackButton,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool isBackIcon = false;
  @override
  void initState() {
    if (widget.isBackButton != null) {
      isBackIcon = widget.isBackButton!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackIcon
          ? const SizedBox.shrink()
          : IconButton(
              onPressed: widget.onPressed,
              icon: SvgPicture.asset(
                'assets/icons/back.svg',
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
                fit: BoxFit.cover,
              ),
            ),
      centerTitle: true,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: Theme.of(context).colorScheme.shadow,
        ),
      ),
    );
  }
}
