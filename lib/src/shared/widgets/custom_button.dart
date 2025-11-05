import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clean_architecture_in_flutter/src/core/resources/app_colors.dart';

enum ButtonSize { small, medium, large }

enum ButtonType { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? shadowColor;
  final double? minWidth;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double prefixIconSpacing;
  final double suffixIconSpacing;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final bool fullWidth;
  final double elevation;
  final bool isLoading;
  final Widget? loadingWidget;
  final MainAxisAlignment iconAlignment;
  final bool? autofocus;
  final FocusNode? focusNode;
  final BoxConstraints? constraints;
  final MaterialTapTargetSize? tapTargetSize;
  final Duration? animationDuration;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderColor,
    this.splashColor,
    this.shadowColor,
    this.minWidth,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconSpacing = 8,
    this.suffixIconSpacing = 8,
    this.borderRadius = 10.16,
    this.borderWidth = 1.0,
    this.padding,
    this.fullWidth = true,
    this.elevation = 0,
    this.isLoading = false,
    this.loadingWidget,
    this.iconAlignment = MainAxisAlignment.center,
    this.autofocus,
    this.focusNode,
    this.constraints,
    this.tapTargetSize,
    this.animationDuration,
  });

  factory CustomButton.primary({
    required Widget child,
    required void Function()? onPressed,
    ButtonSize size = ButtonSize.medium,
    Color? backgroundColor,
    Color? foregroundColor,
    double? minWidth,
    double? height,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double borderRadius = 10.16,
    EdgeInsetsGeometry? padding,
    bool fullWidth = true,
    bool isLoading = false,
    Widget? loadingWidget,
  }) {
    return CustomButton(
      onPressed: onPressed,
      type: ButtonType.primary,
      size: size,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minWidth: minWidth,
      height: height,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderRadius: borderRadius,
      padding: padding,
      fullWidth: fullWidth,
      isLoading: isLoading,
      loadingWidget: loadingWidget,
      child: child,
    );
  }

  factory CustomButton.secondary({
    required Widget child,
    required void Function()? onPressed,
    ButtonSize size = ButtonSize.medium,
    Color? backgroundColor,
    Color? foregroundColor,
    double? minWidth,
    double? height,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double borderRadius = 10.16,
    EdgeInsetsGeometry? padding,
    bool fullWidth = true,
    bool isLoading = false,
    Widget? loadingWidget,
  }) {
    return CustomButton(
      onPressed: onPressed,
      type: ButtonType.secondary,
      size: size,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minWidth: minWidth,
      height: height,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderRadius: borderRadius,
      padding: padding,
      fullWidth: fullWidth,
      isLoading: isLoading,
      loadingWidget: loadingWidget,
      child: child,
    );
  }

  factory CustomButton.outline({
    required Widget child,
    required void Function()? onPressed,
    ButtonSize size = ButtonSize.medium,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    double? minWidth,
    double? height,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double borderRadius = 10.16,
    double borderWidth = 1.0,
    EdgeInsetsGeometry? padding,
    bool fullWidth = true,
    bool isLoading = false,
    Widget? loadingWidget,
  }) {
    return CustomButton(
      onPressed: onPressed,
      type: ButtonType.outline,
      size: size,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      minWidth: minWidth,
      height: height,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      fullWidth: fullWidth,
      isLoading: isLoading,
      loadingWidget: loadingWidget,
      child: child,
    );
  }

  factory CustomButton.text({
    required Widget child,
    required void Function()? onPressed,
    ButtonSize size = ButtonSize.medium,
    Color? foregroundColor,
    double? minWidth,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? padding,
    bool isLoading = false,
    Widget? loadingWidget,
  }) {
    return CustomButton(
      onPressed: onPressed,
      type: ButtonType.text,
      size: size,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor,
      minWidth: minWidth,
      padding: padding,
      fullWidth: false,
      elevation: 0,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      isLoading: isLoading,
      loadingWidget: loadingWidget,
      child: child,
    );
  }

  // Helper methods
  double _getButtonHeight() {
    if (height != null) return height!.h;

    switch (size) {
      case ButtonSize.small:
        return 32.h;
      case ButtonSize.medium:
        return 40.h;
      case ButtonSize.large:
        return 48.h;
    }
  }

  EdgeInsetsGeometry _getButtonPadding() {
    if (padding != null) return padding!;

    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h);
    }
  }

  BorderSide _getBorderSide(BuildContext context) {
    if (type == ButtonType.outline) {
      return BorderSide(
        color: borderColor ?? AppColors.blackPrimary,
        width: borderWidth,
      );
    }
    return BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    // Get theme colors
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine button colors based on type
    Color getBackground() {
      if (backgroundColor != null) return backgroundColor!;

      switch (type) {
        case ButtonType.primary:
          return colorScheme.primary;
        case ButtonType.secondary:
          return colorScheme.secondary;
        case ButtonType.outline:
        case ButtonType.text:
          return Colors.transparent;
      }
    }

    Color getForeground() {
      if (foregroundColor != null) return foregroundColor!;

      switch (type) {
        case ButtonType.primary:
          return colorScheme.onPrimary;
        case ButtonType.secondary:
          return colorScheme.onSecondary;
        case ButtonType.outline:
        case ButtonType.text:
          return colorScheme.primary;
      }
    }

    // Create the button
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style:
          ElevatedButton.styleFrom(
            backgroundColor: getBackground(),
            foregroundColor: getForeground(),
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            padding: _getButtonPadding(),

            minimumSize: Size(
              minWidth != null
                  ? minWidth!.w
                  : (fullWidth ? double.infinity : 0),
              _getButtonHeight(),
            ),
            maximumSize: fullWidth
                ? Size(double.infinity, _getButtonHeight())
                : null,
            elevation: elevation,

            shadowColor: shadowColor,
            shape: RoundedRectangleBorder(
              side: _getBorderSide(context),
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            tapTargetSize: tapTargetSize,
            animationDuration: animationDuration,

            splashFactory: splashColor != null
                ? InkRipple.splashFactory
                : theme.elevatedButtonTheme.style?.splashFactory,
          ).copyWith(
            overlayColor: splashColor != null
                ? WidgetStatePropertyAll(splashColor!.withValues(alpha: 0.1))
                : null,
          ),
      focusNode: focusNode,
      autofocus: autofocus ?? false,

      child: isLoading
          ? loadingWidget ??
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    color: getForeground(),
                  ),
                )
          : Row(
              mainAxisAlignment: iconAlignment,
              mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  SizedBox(width: prefixIconSpacing.w),
                ],
                child,
                if (suffixIcon != null) ...[
                  SizedBox(width: suffixIconSpacing.w),
                  suffixIcon!,
                ],
              ],
            ),
    );
  }
}
