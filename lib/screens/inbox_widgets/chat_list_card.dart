// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:myapp/core/utils/date_util_helper.dart';

// class ChatListCard extends StatelessWidget {
//   final Map<String, dynamic> chat;
//   final VoidCallback onTap;
//   const ChatListCard({super.key, required this.chat, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final unreadCount = chat['unreadCount'] ?? 0;
//     final lastMessageTime = chat['lastMessageTime'] as DateTime;

//     return Card(
//       elevation: 2,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 16.h),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.r),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.02),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: onTap,
//             borderRadius: BorderRadius.circular(16.r),
//             child: Padding(
//               padding: EdgeInsets.all(16.w),
//               child: Row(
//                 children: [
//                   Stack(
//                     children: [
//                       CircleAvatar(
//                         radius: 28.r,
//                         backgroundColor: Colors.grey.withOpacity(0.1),
//                         backgroundImage: NetworkImage(chat['userImage']),
//                       ),
//                       if (unreadCount > 0)
//                         Positioned(
//                           right: 0,
//                           bottom: 0,
//                           child: Container(
//                             padding: EdgeInsets.all(4.w),
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Text(
//                               '$unreadCount',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   16.horizontalSpace,
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               chat['userName'],
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16.sp,
//                               ),
//                             ),
//                             Text(
//                               DateUtilsHelper.formatMessageTime(
//                                 lastMessageTime,
//                               ),
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         6.verticalSpace,
//                         Column(
//                           children: [
//                             Text(
//                               chat['lastMessage'],
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context).textTheme.bodySmall,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
