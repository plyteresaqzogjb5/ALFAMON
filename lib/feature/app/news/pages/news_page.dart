import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:alfamon/common/helpers/show_custom_snack_bar.dart';
import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/styles/const_theme/size.dart';
import 'package:alfamon/feature/app/news/bloc/news_bloc.dart';
import 'package:alfamon/feature/app/news/pages/news_detial.dart';

class NewsPageWidget extends StatefulWidget {
  const NewsPageWidget({super.key});

  @override
  State<NewsPageWidget> createState() => _NewsPageWidgetState();
}

class _NewsPageWidgetState extends State<NewsPageWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool? isChangedTab = false;

  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(GetNewsCountriesTravelEvent());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.index == 1) {
      BlocProvider.of<NewsBloc>(context).add(GetNewsTipsTravelEvent());

      setState(() {
        isChangedTab = true;
      });
    } else if (_tabController.index == 0) {
      BlocProvider.of<NewsBloc>(context).add(GetNewsCountriesTravelEvent());
      setState(() {
        isChangedTab = false;
      });
    }
  }

  List<News?> newsList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsTabSecondlLoaded) {
          // setState(() {
          newsList = state.responsed;
          // });
        } else if (state is NewsTabOnelLoaded) {
          // setState(() {
          newsList = state.responsed;
          // });
        } else if (state is NewsError) {
          showCustomSnackBar(context, state.failure.message);
        } else if (state is NewslLoading) {
          // setState(() {
          newsList = [];
          // });
        }
      },
      builder: (context, state) {
        if (state is NewsError) {
          return Scaffold(
            body: Center(
              child: Text(
                '${state.failure.message}, try later',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(toolbarHeight: 35.0, automaticallyImplyLeading: false),
          body: state is NewslLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 75,
                      child: TabBar(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        dividerColor:
                            Theme.of(context).colorScheme.background,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.transparent),
                        tabs: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            decoration: BoxDecoration(
                              border: isChangedTab!
                                  ? null
                                  : Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      width: 1),
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Countries for traveling',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            decoration: BoxDecoration(
                              border: isChangedTab!
                                  ? Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      width: 1)
                                  : null,
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Tips for travelers',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: SizeConfig.marginHoriontal),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                return NewsContainerWidget(
                                    news: newsList[index]!, tabChange: true);
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                return NewsContainerWidget(
                                    news: newsList[index], tabChange: false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class NewsContainerWidget extends StatelessWidget {
  final News? news;
  final bool tabChange;

  const NewsContainerWidget({
    super.key,
    required this.news,
    required this.tabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          news?.title ?? '',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Container(
                height: 109,
                width: 109,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.shadow,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: news?.urlToImage != null && news!.urlToImage!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: news?.urlToImage ?? '',
                        fit: BoxFit.cover,

                        placeholder: (context, url) =>
                            const CircularProgressIndicator(), // Placeholder widget while loading
                        errorWidget: (context, url, error) => const Icon(
                            Icons.error), // Widget to display in case of error
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.shadow,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      )),
            const SizedBox(width: 25),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('MM.dd.y')
                        .format(DateTime.parse(news?.publishedAt ?? '')),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    news?.description ?? '',
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailNewsWidget(data: news)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Read more',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
