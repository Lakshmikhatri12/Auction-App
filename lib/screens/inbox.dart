// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:myapp/core/constants/app_sizes.dart';
// import 'package:myapp/core/constants/app_static_data.dart';
// import 'package:myapp/features/inbox/widgets/chat_list_card.dart';
// import 'package:myapp/features/inbox/widgets/inbox_header.dart';
// import 'chat_screen.dart';

// class InboxScreen extends StatelessWidget {
//   const InboxScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List chatList = AppStaticData.dummyChats;
//     return Scaffold(
//       body: Stack(
//         children: [
//           InboxHeader(),
//           Positioned(
//             top: 134.h,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(AppSizes.radiusLG.r),
//                   topRight: Radius.circular(AppSizes.radiusLG.r),
//                 ),
//               ),
//               child: SizedBox(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: AppSizes.paddingXL.h),
//                   child: ListView.builder(
//                     itemCount: chatList.length,
//                     itemBuilder: (context, index) {
//                       final chat = chatList[index];
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: AppSizes.paddingMD.w,
//                         ),
//                         child: ChatListCard(
//                           chat: chat,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (_) => ChatScreen()),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
