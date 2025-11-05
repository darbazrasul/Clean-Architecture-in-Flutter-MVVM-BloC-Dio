// import 'package:admin_property_managment/core/resources/color_manager.dart';
// import 'package:admin_property_managment/core/resources/styles_manager.dart';
// import 'package:admin_property_managment/core/resources/app_size.dart';
// import 'package:admin_property_managment/core/resources/assets.dart';
// import 'package:admin_property_managment/core/utils/space_extension.dart';
// import 'package:admin_property_managment/shared/widgets/custom_svg_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomTextField extends StatefulWidget {
//   // Text and Content
//   final String? hintText;
//   final String? titleText;
//   final String? labelText;
//   final String? helperText;
//   final TextAlign textAlign;
//   final TextEditingController? controller;

//   // Focus Management
//   final FocusNode? focusNode;
//   final FocusNode? nextFocus;
//   final bool autofocus;
//   final void Function(PointerDownEvent)? onTapOutside;

//   // Input Configuration
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final bool isPassword;
//   final bool isAmount;
//   final bool showCodePicker;
//   final bool isRequiredFill;
//   final bool readOnly;
//   final bool isEnabled;
//   final int? maxLength;
//   final int maxLines;
//   final int? minLines;
//   final TextCapitalization capitalization;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool obscureText;

//   // Styling
//   final bool filled;
//   final Color? fillColor;
//   final dynamic borderRadius; // Changed to dynamic to support BorderRadius
//   final bool showBorder;
//   final bool showLabelText;
//   final EdgeInsetsGeometry? contentPadding;
//   final double? height;
//   final Color? cursorColor;
//   final Color? borderColor;
//   final Color? focusedBorderColor;
//   final Color? errorBorderColor;
//   final double borderWidth;
//   final double focusedBorderWidth;
//   final double errorBorderWidth;

//   // Prefix Configuration
//   final String? prefixIcon;
//   final Widget? prefixWidget;
//   final double prefixHeight;
//   final Color? prefixIconColor;
//   final bool showPrefixIconBorder;
//   final Color? prefixIconBackgroundColor;

//   // Suffix Configuration
//   final String? suffixIcon;
//   final String? suffixIconOff;
//   final Widget? suffixWidget;
//   final double suffixIconSize;
//   final Color? suffixIconColor;
//   final bool showSuffixIconBorder;
//   final Color? suffixIconBackgroundColor;

//   // Country Code Picker
//   final String? countryDialCode;
//   final String? countryFlag;
//   final Color? countryCodeTextColor;
//   final Color? dividerColor;

//   // Borders
//   final InputBorder? border;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final InputBorder? errorBorder;

//   // Callbacks
//   final void Function()? onTap;
//   final void Function()? suffixOnTap;
//   final void Function()? prefixOnTap;
//   final Function(String text)? onChanged;
//   final String? Function(String?)? validator;
//   final void Function()? onCountryChanged;
//   final bool required;
//   final void Function()? onSubmit;
//   final Function(String)? onFieldSubmitted;

//   // Additional Styling
//   final BoxConstraints? constraints;
//   final TextStyle? titleStyle;
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final TextStyle? helperStyle;
//   final TextStyle? errorStyle;
//   final TextStyle? labelStyle;

//   // Animation
//   final Duration? animationDuration;
//   final bool animateHint;

//   // Custom Password Eye Icons
//   final Widget? passwordVisibleIcon;
//   final Widget? passwordHiddenIcon;

//   // Phone Number Specific
//   final bool hideCounter;

//   const CustomTextField({
//     super.key,
//     this.hintText = 'Write something...',
//     this.controller,
//     this.focusNode,
//     this.titleText,
//     this.nextFocus,
//     this.isEnabled = true,
//     this.inputType = TextInputType.text,
//     this.inputAction = TextInputAction.next,
//     this.maxLines = 1,
//     this.minLines,
//     this.onChanged,
//     this.onTap,
//     this.prefixIcon,
//     this.prefixWidget,
//     this.suffixIcon,
//     this.suffixWidget,
//     this.suffixIconSize = 12,
//     this.capitalization = TextCapitalization.none,
//     this.readOnly = false,
//     this.isPassword = false,
//     this.isAmount = false,
//     this.showCodePicker = false,
//     this.isRequiredFill = false,
//     this.showLabelText = true,
//     this.showBorder = false,
//     this.filled = false,
//     this.fillColor,
//     this.borderRadius = 8,
//     this.prefixHeight = 50,
//     this.countryDialCode,
//     this.onCountryChanged,
//     this.validator,
//     this.inputFormatters,
//     this.labelText,
//     this.textAlign = TextAlign.start,
//     this.required = false,
//     this.suffixOnTap,
//     this.prefixOnTap,
//     this.border,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.errorBorder,
//     this.suffixIconOff,
//     this.constraints,
//     this.onSubmit,
//     this.titleStyle,
//     this.textStyle,
//     this.onTapOutside,
//     this.autofocus = false,
//     this.maxLength,
//     this.helperText,
//     this.contentPadding,
//     this.height,
//     this.cursorColor,
//     this.borderColor,
//     this.focusedBorderColor,
//     this.errorBorderColor,
//     this.borderWidth = AppSize.s0_5,
//     this.focusedBorderWidth = AppSize.s1_5,
//     this.errorBorderWidth = AppSize.s2,
//     this.prefixIconColor,
//     this.suffixIconColor,
//     this.countryFlag,
//     this.countryCodeTextColor,
//     this.dividerColor,
//     this.hintStyle,
//     this.helperStyle,
//     this.errorStyle,
//     this.labelStyle,
//     this.animationDuration,
//     this.animateHint = true,
//     this.showPrefixIconBorder = false,
//     this.showSuffixIconBorder = false,
//     this.prefixIconBackgroundColor,
//     this.suffixIconBackgroundColor,
//     this.passwordVisibleIcon,
//     this.passwordHiddenIcon,
//     this.onFieldSubmitted,
//     this.obscureText = false,
//     this.hideCounter = false,
//   });

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();
//     _focusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     if (widget.focusNode == null) {
//       _focusNode.dispose();
//     }
//     super.dispose();
//   }

//   void _onFocusChange() {
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.titleText != null)
//           RichText(
//             text: TextSpan(
//               text: widget.titleText ?? "",
//               style:
//                   widget.titleStyle ??
//                   AppTextStyles.poppinsRegular12.copyWith(
//                     color: ColorManager.lightGrey,
//                     fontSize: 12,
//                   ),
//               children: [
//                 if (widget.isRequiredFill)
//                   TextSpan(
//                     text: " *",
//                     style: TextStyle(
//                       color: widget.errorBorderColor ?? const Color(0xffE61010),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         if (widget.titleText != null) 8.toHieght,
//         SizedBox(
//           height: widget.height,
//           child: TextFormField(
//             onTapOutside:
//                 widget.onTapOutside ??
//                 (event) => FocusManager.instance.primaryFocus?.unfocus(),
//             maxLines: widget.maxLines,
//             minLines: widget.minLines,
//             maxLength: widget.maxLength,
//             controller: widget.controller,
//             focusNode: _focusNode,
//             validator: widget.validator,
//             textAlign: widget.textAlign,
//             readOnly: widget.readOnly,
//             onEditingComplete: widget.onSubmit,
//             onTap: widget.onTap,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             style:
//                 widget.textStyle ??
//                 AppTextStyles.poppinsRegular12.copyWith(
//                   color: ColorManager.white,
//                 ),
//             textInputAction: widget.inputAction,
//             keyboardType: widget.inputType,
//             cursorColor: widget.cursorColor ?? Colors.white,
//             textCapitalization: widget.capitalization,
//             enabled: widget.isEnabled,
//             autofocus: widget.autofocus,
//             autofillHints: _getAutofillHints(),
//             obscureText: widget.isPassword ? _obscureText : widget.obscureText,
//             inputFormatters: _getInputFormatters(),
//             onFieldSubmitted: (text) {
//               if (widget.onFieldSubmitted != null) {
//                 widget.onFieldSubmitted!(text);
//               } else if (widget.nextFocus != null) {
//                 FocusScope.of(context).requestFocus(widget.nextFocus);
//               }
//             },
//             onChanged: widget.onChanged,
//             decoration: InputDecoration(
//               contentPadding: widget.contentPadding,
//               hintStyle: widget.hintStyle ?? AppTextStyles.poppinsRegular12,
//               helperText: widget.helperText,
//               helperStyle: widget.helperStyle,
//               labelText: widget.showLabelText ? widget.labelText : null,
//               labelStyle: widget.labelStyle,
//               floatingLabelBehavior: widget.animateHint
//                   ? FloatingLabelBehavior.auto
//                   : FloatingLabelBehavior.never,
//               constraints: widget.constraints,
//               alignLabelWithHint: true,
//               counterText: widget.hideCounter
//                   ? ""
//                   : null, // Hide counter only when needed
//               border: widget.border ?? buildInputBorder(context),
//               focusedBorder:
//                   widget.focusedBorder ??
//                   buildInputBorder(
//                     context,
//                     color: widget.focusedBorderColor,
//                     width: widget.focusedBorderWidth,
//                   ),
//               enabledBorder:
//                   widget.enabledBorder ??
//                   buildInputBorder(context, color: widget.borderColor),
//               errorBorder:
//                   widget.errorBorder ??
//                   buildInputBorder(
//                     context,
//                     color: widget.errorBorderColor,
//                     width: widget.errorBorderWidth,
//                   ),
//               filled: widget.filled,
//               fillColor: widget.fillColor,
//               errorStyle: widget.errorStyle ?? TextStyle(fontSize: 8.sp),
//               hintText: widget.hintText,
//               prefixIcon: _buildPrefixIcon(),
//               suffixIcon: _buildSuffixIcon(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   List<String>? _getAutofillHints() {
//     if (widget.inputType == TextInputType.name) {
//       return [AutofillHints.name];
//     } else if (widget.inputType == TextInputType.emailAddress) {
//       return [AutofillHints.email];
//     } else if (widget.inputType == TextInputType.phone) {
//       return [AutofillHints.telephoneNumber];
//     } else if (widget.inputType == TextInputType.streetAddress) {
//       return [AutofillHints.fullStreetAddress];
//     } else if (widget.inputType == TextInputType.url) {
//       return [AutofillHints.url];
//     } else if (widget.inputType == TextInputType.visiblePassword) {
//       return [AutofillHints.password];
//     }
//     return null;
//   }

//   List<TextInputFormatter>? _getInputFormatters() {
//     // Don't override input formatters if they're already provided
//     if (widget.inputFormatters != null) {
//       return widget.inputFormatters;
//     }

//     if (widget.inputType == TextInputType.phone) {
//       return <TextInputFormatter>[
//         FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
//       ];
//     } else if (widget.isAmount) {
//       return [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))];
//     }
//     return null;
//   }

//   Widget? _buildPrefixIcon() {
//     if (widget.prefixWidget != null) {
//       return widget.prefixWidget;
//     } else if (widget.prefixIcon != null) {
//       return InkWell(
//         onTap: widget.prefixOnTap,
//         child: Container(
//           width: widget.prefixHeight,
//           padding: const EdgeInsets.all(1),
//           decoration: BoxDecoration(
//             color: widget.prefixIconBackgroundColor,
//             border: widget.showPrefixIconBorder
//                 ? Border.all(
//                     color: widget.borderColor ?? ColorManager.lightGrey,
//                   )
//                 : null,
//             borderRadius: _getBorderRadius(isPrefix: true),
//           ),
//           child: Center(
//             child: GetSVGImage(
//               path: widget.prefixIcon!,
//               color: _focusNode.hasFocus
//                   ? ColorManager.grey
//                   : widget.prefixIconColor ?? Colors.grey.shade600,
//             ),
//           ),
//         ),
//       );
//     } else if (widget.showCodePicker) {
//       return GestureDetector(
//         onTap: widget.onCountryChanged,
//         child: SizedBox(
//           width: 90.w,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 widget.countryFlag ?? '',
//                 width: 18.w,
//                 height: 11.h,
//               ),
//               5.toWidth,
//               Text(
//                 textDirection: TextDirection.ltr,
//                 "+${widget.countryDialCode}",
//                 style: TextStyle(
//                   color: widget.countryCodeTextColor ?? Colors.white,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(
//                 height: 45.h,
//                 child: VerticalDivider(
//                   color: widget.dividerColor ?? ColorManager.lightGrey,
//                   thickness: 1.5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return null;
//   }

//   Widget? _buildSuffixIcon() {
//     if (widget.suffixWidget != null) {
//       return widget.suffixWidget;
//     } else if (widget.isPassword) {
//       return IconButton(
//         icon: _obscureText
//             ? (widget.passwordHiddenIcon ??
//                   GetSVGImage(
//                     color: ColorManager.grey,
//                     path: Assets.iconEyeOff,
//                     height: 20.h,
//                     width: 20.w,
//                   ))
//             : (widget.passwordVisibleIcon ??
//                   GetSVGImage(
//                     color: ColorManager.grey,
//                     path: Assets.iconEyeOn,
//                     height: 20.h,
//                     width: 20.w,
//                   )),
//         onPressed: _toggle,
//       );
//     } else if (widget.suffixIcon != null) {
//       return SizedBox(
//         width: 24.w,
//         height: 24.h,
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: InkWell(
//             onTap: widget.suffixOnTap,
//             child: GetSVGImage(
//               path: widget.suffixIcon!,
//               color: widget.suffixIconColor ?? ColorManager.primary,
//             ),
//           ),
//         ),
//       );
//     }
//     return null;
//   }

//   BorderRadius _getBorderRadius({bool isPrefix = false}) {
//     if (widget.borderRadius is BorderRadius) {
//       return widget.borderRadius as BorderRadius;
//     } else if (widget.borderRadius is double) {
//       double radius = widget.borderRadius as double;
//       if (isPrefix) {
//         return BorderRadius.only(
//           topLeft: Radius.circular(radius),
//           bottomLeft: Radius.circular(radius),
//         );
//       }
//       return BorderRadius.circular(radius);
//     }
//     return BorderRadius.circular(8.0);
//   }

//   OutlineInputBorder buildInputBorder(
//     BuildContext context, {
//     Color? color,
//     double? width,
//   }) {
//     BorderRadius borderRadius;

//     if (widget.borderRadius is BorderRadius) {
//       borderRadius = widget.borderRadius as BorderRadius;
//     } else if (widget.borderRadius is double) {
//       borderRadius = BorderRadius.circular(widget.borderRadius as double);
//     } else {
//       borderRadius = BorderRadius.circular(8.0);
//     }

//     return OutlineInputBorder(
//       borderRadius: borderRadius,
//       borderSide: BorderSide(
//         width: width ?? widget.borderWidth,
//         color: color ?? widget.borderColor ?? ColorManager.lightGrey,
//       ),
//     );
//   }

//   void _toggle() {
//     if (mounted) {
//       setState(() {
//         _obscureText = !_obscureText;
//       });
//     }
//   }
// }
