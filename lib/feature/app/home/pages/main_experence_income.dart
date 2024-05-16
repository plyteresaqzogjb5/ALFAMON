import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';
import 'package:pp_14_copy/feature/app/home/widgets/expence_body.dart';
import 'package:pp_14_copy/feature/app/home/widgets/income_body.dart';

class MainExpenseIncomeWidget extends StatefulWidget {
  const MainExpenseIncomeWidget({super.key});

  @override
  State<MainExpenseIncomeWidget> createState() =>
      _MainExpenseIncomeWidgetState();
}

class _MainExpenseIncomeWidgetState extends State<MainExpenseIncomeWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
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
        padding:
            const EdgeInsets.symmetric(horizontal: SizeConfig.marginHoriontal),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children:  const [
                     ExpenceBodyWidget(false),
                     InComeBodyWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
