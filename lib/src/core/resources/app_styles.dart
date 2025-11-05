// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppTextStyles {
//   AppTextStyles._();
//   static TextStyle poppinsLight24 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w300,
//     height: 30.h / 24.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight20 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w300,
//     height: 28.h / 20.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight18 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w300,
//     height: 26.h / 18.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight16 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w300,
//     height: 24.h / 16.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight14 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w300,
//     height: 22.h / 14.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight12 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w300,
//     height: 18.h / 12.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsLight10 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 10.sp,
//     fontWeight: FontWeight.w300,
//     height: 16.h / 10.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular24 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w400,
//     height: 30.h / 24.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular20 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w400,
//     height: 28.h / 20.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular18 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w400,
//     height: 26.h / 18.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular16 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w400,
//     height: 24.h / 16.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular14 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w400,
//     height: 22.h / 14.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsRegular12 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     // height: 22.h / 12.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsMedium24 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w500,
//     height: 30.h / 24.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsMedium20 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w500,
//     height: 28.h / 20.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsMedium18 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w500,
//     height: 26.h / 18.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsMedium16 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w500,
//     height: 24.h / 16.h,
//     color: ColorManager.grey,
//   );

//   static TextStyle poppinsMedium14 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     height: 22.h / 14.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsMedium12 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     height: 18.h / 12.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold24 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w700,
//     height: 30.h / 24.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold20 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w700,
//     height: 28.h / 20.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold18 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w700,
//     height: 26.h / 18.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold16 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w700,
//     height: 24.h / 16.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold14 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w700,
//     height: 22.h / 14.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold12 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w700,
//     height: 18.h / 12.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsBold10 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 10.sp,
//     fontWeight: FontWeight.w700,
//     height: 16.h / 10.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold24 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w600,
//     height: 30.h / 24.h,

//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold20 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w600,
//     height: 28.h / 20.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold18 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w600,
//     height: 26.h / 18.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold16 = TextStyle(
//     fontFamily: FontConstants.fontFamily,

//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     height: 24.h / 16.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold14 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w600,
//     height: 21.h / 14.h,
//     color: ColorManager.primary,
//   );

//   static TextStyle poppinsSemiBold12 = TextStyle(
//     fontFamily: FontConstants.fontFamily,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w600,
//     height: 18.h / 12.h,
//     color: ColorManager.primary,
//   );
// }
