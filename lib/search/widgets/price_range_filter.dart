import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_colors.dart';

class PriceRangeFilter extends StatefulWidget {
  const PriceRangeFilter({super.key});

  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  final int minPrice = 1000;
  final int maxPrice = 10000;

  RangeValues _currentRange = const RangeValues(1000, 10000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          values: _currentRange,
          min: minPrice.toDouble(),
          max: maxPrice.toDouble(),
          divisions: 6,
          labels: RangeLabels(
            _currentRange.start.toInt().toString(),
            _currentRange.end.toInt().toString(),
          ),
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.primaryColor.withOpacity(0.3),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRange = RangeValues(
                values.start.roundToDouble(),
                values.end.roundToDouble(),
              );
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${_currentRange.start.toInt()}'),
            Text('\$${_currentRange.end.toInt()}'),
          ],
        ),
      ],
    );
  }
}
