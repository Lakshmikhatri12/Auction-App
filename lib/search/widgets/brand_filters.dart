import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_sizes.dart';
import 'package:myapp/core/constants/app_static_data.dart';
import 'package:myapp/shared/widgets/custom_choice_chip.dart';

class BrandFilters extends StatefulWidget {
  final ValueChanged<int>? onSelected;

  const BrandFilters({super.key, this.onSelected});

  @override
  State<BrandFilters> createState() => _BrandFiltersState();
}

class _BrandFiltersState extends State<BrandFilters> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List brands = AppStaticData.brands;
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingS.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onSelected?.call(index);
              },
              child: Center(
                child: CustomChoiceChip(
                  label: brands[index],
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onSelected?.call(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
