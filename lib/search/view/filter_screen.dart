import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_sizes.dart';
import 'package:myapp/features/search/widgets/brand_filters.dart';
import 'package:myapp/features/search/widgets/gender_filters.dart';
import 'package:myapp/features/search/widgets/price_range_filter.dart';
import 'package:myapp/features/search/widgets/reviews_filter.dart';
import 'package:myapp/features/search/widgets/sortby.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLG.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              _text("Brands", context),
              BrandFilters(),
              _text("Gender", context),
              GenderFilters(),
              _text("Sort by", context),
              Sortby(),
              _text("Pricing Range", context),
              PriceRangeFilter(),
              _text("Reviews Range", context),
              ReviewFilter(),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMD,
          vertical: AppSizes.paddingS,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).dividerColor),
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  "Apply Filter",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String label, BuildContext context) {
    return Text(label, style: Theme.of(context).textTheme.titleLarge);
  }
}
