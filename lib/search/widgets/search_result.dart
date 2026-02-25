import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Routes/app_routes.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/shared/widgets/custom_product_listing_card.dart';
import 'package:myapp/shared/widgets/custom_text_button.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  static final List<Map<String, dynamic>> results = [
    {
      "title": "Jacket",
      "price": 240.0,
      "rating": 4.5,
      "isFavourite": true,
      "image":
          "https://cdn.pixabay.com/photo/2021/12/23/16/47/men-6889598_1280.jpg",
    },
    {
      "title": "Leather Jacket",
      "price": 940.0,
      "rating": 4.0,
      "isFavourite": false,
      "image":
          "https://cdn.pixabay.com/photo/2017/10/06/04/32/jacket-2821961_1280.jpg",
    },
    {
      "title": "Girls Jacket",
      "price": 690.0,
      "rating": 4.2,
      "isFavourite": false,
      "image":
          "https://cdn.pixabay.com/photo/2021/05/09/12/51/fluttering-hair-6240821_1280.jpg",
    },
    {
      "title": "Puffer Jacket",
      "price": 2400.0,
      "rating": 4.8,
      "isFavourite": true,
      "image":
          "data:image/jpeg;base64,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",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.filter);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 5.w,
            children: [
              Icon(Icons.filter_list, color: AppColors.textSecondary),
              Text("Filter", style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " results for Jacket",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "${results.length} found",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        10.verticalSpace,
        Expanded(
          child: GridView.builder(
            itemCount: results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              mainAxisExtent: 280.h,
            ),
            itemBuilder: (context, index) {
              final item = results[index];

              return CustomProductListingCard(
                image: item['image'],
                title: item['title'],
                price: item['price'],
                rating: item['rating'],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
