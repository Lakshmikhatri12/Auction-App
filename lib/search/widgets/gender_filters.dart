import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_sizes.dart';
import 'package:myapp/core/constants/app_static_data.dart';
import 'package:myapp/shared/widgets/custom_choice_chip.dart';

class GenderFilters extends StatefulWidget {
  final ValueChanged<int>? onSelected;

  const GenderFilters({super.key, this.onSelected});

  @override
  State<GenderFilters> createState() => _GenderFiltersState();
}

class _GenderFiltersState extends State<GenderFilters> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List gender = AppStaticData.genderList;
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gender.length,
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
                  label: gender[index],
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
