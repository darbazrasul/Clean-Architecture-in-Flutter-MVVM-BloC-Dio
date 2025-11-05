// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomSnackbar {
//   static void showSuccessSnackbar(
//     BuildContext context, {
//     required String message,
//   }) {
//     _showSnackbar(
//       context: context,
//       icon: Assets.iconCheck,
//       textColor: Colors.green,
//       message: message,
//     );
//   }

//   static void showErrorSnackbar(
//     BuildContext context, {
//     required String message,
//   }) {
//     _showSnackbar(
//       context: context,
//       icon: Assets.iconWarning,
//       textColor: const Color(0xFFFF5555),
//       message: message,
//     );
//   }

//   static void showInfoSnackbar(
//     BuildContext context, {
//     required String message,
//   }) {
//     _showSnackbar(
//       context: context,
//       icon: Assets.iconInfo,
//       textColor: ColorManager.primary,
//       message: message,
//     );
//   }

//   static void showVerificationSnackbar(
//     BuildContext context, {
//     required String message,
//     VoidCallback? onVerify,
//   }) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.symmetric(
//           horizontal: AppSize.s16.w,
//           vertical: AppSize.s16.h,
//         ),
//         duration: const Duration(seconds: 6),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s16.r),
//         ),
//         content: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(Assets.iconEyeOff),
//             SizedBox(width: AppSize.s12.w),
//             Expanded(
//               child: Text(
//                 message,
//                 style: TextStyle(
//                   color: const Color(0xFFFF9955),
//                   fontSize: AppSize.s12.sp,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//         action: SnackBarAction(
//           label: 'VERIFY NOW',
//           textColor: Colors.white,
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//             if (onVerify != null) onVerify();
//           },
//         ),
//       ),
//     );
//   }

//   static void _showSnackbar({
//     required BuildContext context,
//     required String icon,
//     required String message,
//     required Color textColor,
//   }) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,

//         margin: EdgeInsets.symmetric(
//           horizontal: AppSize.s16.w,
//           vertical: AppSize.s16.h,
//         ),
//         duration: const Duration(seconds: 3),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s16.r),
//         ),
//         content: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(icon, width: AppSize.s20.w, height: AppSize.s20.h),
//             SizedBox(width: AppSize.s12.w),
//             Expanded(
//               child: Text(
//                 message,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: AppSize.s12.sp,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//         action: SnackBarAction(
//           label: 'DISMISS',
//           textColor: textColor,
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           },
//         ),
//       ),
//     );
//   }
// }
