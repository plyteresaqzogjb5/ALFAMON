import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/home/widgets/expence_body.dart';
import 'package:pp_14_copy/feature/app/home/widgets/income_body.dart';
import 'package:pp_14_copy/feature/app/manual/confrim_widget.dart';
import 'package:pp_14_copy/feature/app/manual/maunal_4.dart';

class ManualThreePage extends StatefulWidget {
  const ManualThreePage({super.key});

  @override
  State<ManualThreePage> createState() => _ManualThreePageState();
}

class _ManualThreePageState extends State<ManualThreePage>
    with SingleTickerProviderStateMixin {
   late OverlayEntry _overlayEntry;

  DateTime selectedDate = DateTime.now();
  late TabController _tabController;
  double getTopPosition(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 800) {
      return 150;
    } else if (screenHeight <= 1000) {
      return 190;
    } else {
      return 210;
    }
  }

    @override
  void initState() {
        _tabController = TabController(length: 2, vsync: this);

    _overlayEntry = _creayeOverlayEntry();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });
    super.initState();
  }



  OverlayEntry _creayeOverlayEntry() {
    return OverlayEntry(builder: (context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width * 1,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                     color: Colors.white,),
                onPressed: () {
                 _oncancel(context);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: getTopPosition(context)),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset('assets/icon/maunals3.svg'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManualFourPage()),
                    );
                    _overlayEntry.remove();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(47),
                      ),
                    ),
                  ),
                  child: Text(
                    'OK',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                           color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),

                // Center(
              ],
            ),
          ],
        ),
      ),
    );
  });
  }
  _oncancel(BuildContext context) {
    _overlayEntry.remove();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          onPressed: () {
            Navigator.of(context).pop();

            _overlayEntry = _creayeOverlayEntry();
            // _creayeOverlayEntry();
            // Добавляем OverlayEntry в Overlay при построении виджета
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Overlay.of(context).insert(_overlayEntry);
            });
          }, theme: Theme.of(context),
        );
      },
    );
  }
  @override
  void dispose() {
    // Удаляем OverlayEntry при удалении состояния
    _overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              leading: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                dividerColor: Theme.of(context).colorScheme.background,
                indicatorColor: Theme.of(context).colorScheme.onBackground,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: Theme.of(context).colorScheme.primary,

                unselectedLabelColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.only(right: 50),

                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                tabs: const [
                  Tab(text: 'Expense'),
                  Tab(text: 'Income'),
                ],
                labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                //               ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SizeConfig.marginHoriontal),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: const [
                          ExpenceBodyWidget(true),
                          InComeBodyWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Размытие с силой 5
              child: Container(
                color:
                    Colors.black.withOpacity(0.3), // Цвет с прозрачностью 0.5
              ),
            ),
          ),
        ],
      ),
    );
  }
}
