import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_static_data.dart';

class ReviewFilter extends StatefulWidget {
  const ReviewFilter({super.key});

  @override
  State<ReviewFilter> createState() => _ReviewFilterState();
}

class _ReviewFilterState extends State<ReviewFilter> {
  String selectedReview = "4.5 or above";

  @override
  Widget build(BuildContext context) {
    final List<String> reviews = AppStaticData.reviewList;

    return Column(
      children: reviews.map((review) {
        bool isSelected = review == selectedReview;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedReview = review;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
            child: Row(
              children: [
                ..._buildStars(review),
                SizedBox(width: 8.w),
                Text(
                  review,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 14.sp),
                ),
                Spacer(),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Theme.of(context).colorScheme.onSurface,
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  List<Widget> _buildStars(String reviewText) {
    double rating = _extractRating(reviewText);

    List<Widget> stars = [];

    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: AppColors.ratingColor, size: 18.sp));
    }

    if (hasHalfStar) {
      stars.add(
        Icon(Icons.star_half, color: AppColors.ratingColor, size: 18.sp),
      );
    }

    return stars;
  }

  double _extractRating(String text) {
    if (text.contains("or above")) {
      return double.parse(text.split(" ").first);
    } else {
      return double.parse(text.split("-").first);
    }
  }
}
