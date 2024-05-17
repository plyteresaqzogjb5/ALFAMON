import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/styles/const_theme/size.dart';

class DetailNewsWidget extends StatelessWidget {
  final News? data;

  const DetailNewsWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime? date) {
      if (date == null) return '';
      final formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(date);
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: SizeConfig.marginHoriontal,
            vertical: SizeConfig.marginTop,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data?.urlToImage != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.shadow,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: data!.urlToImage!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: data?.urlToImage ?? '',
                                fit: BoxFit.cover,

                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(), // Placeholder widget while loading
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons
                                        .error), // Widget to display in case of error
                              )
                            : const SizedBox(),
                      ),
                    )
                  : const SizedBox(),

              Text(
                data?.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                data?.publishedAt != null
                    ? formatDate(DateTime.parse(data!.publishedAt!))
                    : '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w200),
              ),

              // const SizedBox(height: 20),
              const SizedBox(height: 10),
              Text(
                data?.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 10),

              Text(
                data?.source?.name ?? '',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .color!
                        .withOpacity(0.5)),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
