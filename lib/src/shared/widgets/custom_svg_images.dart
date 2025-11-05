import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetSVGImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;

  final Color? color;
  final EdgeInsetsGeometry? padding;

  const GetSVGImage({
    super.key,
    required this.path,
    this.width,
    this.color,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        path,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
