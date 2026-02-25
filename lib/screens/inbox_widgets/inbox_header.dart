// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:myapp/core/constants/app_colors.dart';
// import 'package:myapp/core/constants/app_sizes.dart';

// class InboxHeader extends StatelessWidget {
//   const InboxHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       color: AppColors.primaryColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           34.verticalSpace,
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLG.w),
//             child: Text(
//               "Messages",
//               style: Theme.of(
//                 context,
//               ).textTheme.headlineLarge?.copyWith(color: AppColors.textwhite),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 35.w,
//               vertical: AppSizes.paddingMD.h,
//             ),
//             child: Container(
//               height: 45.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppSizes.radiusMD.r),
//                 border: Border.all(color: Theme.of(context).dividerColor),
//               ),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   hintText: "search",
//                   hintStyle: TextStyle(color: Colors.white70),
//                   border: InputBorder.none,
//                   suffixIcon: Icon(Icons.search, color: AppColors.textwhite),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
