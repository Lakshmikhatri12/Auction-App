import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_sizes.dart';
import 'package:myapp/core/constants/app_static_data.dart';
import 'package:myapp/shared/widgets/custom_choice_chip.dart';

class Sortby extends StatefulWidget {
  final ValueChanged<int>? onSelected;

  const Sortby({super.key, this.onSelected});

  @override
  State<Sortby> createState() => _SortbyState();
}

class _SortbyState extends State<Sortby> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List sortby = AppStaticData.sortBy;
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sortby.length,
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
                  label: sortby[index],
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
