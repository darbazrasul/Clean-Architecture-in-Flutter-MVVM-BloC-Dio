import 'package:flutter/material.dart';

/// A versatile spacing widget that can be used in various layouts.
/// 
/// Features:
/// - Auto-detects Row/Column context for appropriate spacing direction
/// - Supports explicit direction control with [SpacerType]
/// - Predefined spacing constants for consistent design
/// - Responsive spacing based on screen size
class CustomSpacer extends StatelessWidget {
  /// Predefined spacing constants
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  /// The amount of space to add
  final double space;
  
  /// Optional explicit spacer type
  final SpacerType? type;
  
  /// Whether to make the spacing responsive based on screen width
  final bool responsive;

  /// Create a spacer with specific space value
  const CustomSpacer({
    super.key,
    this.space = sm,
    this.type,
    this.responsive = false,
  });

  /// Create a tiny spacer (4px)
  const CustomSpacer.xSmall({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: xs, type: type, responsive: responsive);

  /// Create a small spacer (8px)
  const CustomSpacer.small({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: sm, type: type, responsive: responsive);

  /// Create a medium spacer (16px)
  const CustomSpacer.medium({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: md, type: type, responsive: responsive);

  /// Create a large spacer (24px)
  const CustomSpacer.large({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: lg, type: type, responsive: responsive);

  /// Create an extra large spacer (32px)
  const CustomSpacer.xLarge({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: xl, type: type, responsive: responsive);

  /// Create an extra extra large spacer (48px)
  const CustomSpacer.xxLarge({Key? key, SpacerType? type, bool responsive = false})
      : this(key: key, space: xxl, type: type, responsive: responsive);

  /// Create a horizontal-only spacer
  const CustomSpacer.horizontal({Key? key, double space = sm, bool responsive = false})
      : this(key: key, space: space, type: SpacerType.horizontal, responsive: responsive);

  /// Create a vertical-only spacer
  const CustomSpacer.vertical({Key? key, double space = sm, bool responsive = false})
      : this(key: key, space: space, type: SpacerType.vertical, responsive: responsive);

  @override
  Widget build(BuildContext context) {
    // Get responsive factor based on screen size if responsive is true
    final responsiveFactor = responsive ? _getResponsiveFactor(context) : 1.0;
    final adjustedSpace = space * responsiveFactor;

    // If type is explicitly set, use that direction
    if (type != null) {
      switch (type!) {
        case SpacerType.horizontal:
          return SizedBox(width: adjustedSpace);
        case SpacerType.vertical:
          return SizedBox(height: adjustedSpace);
        case SpacerType.both:
          return SizedBox(width: adjustedSpace, height: adjustedSpace);
      }
    }

    // Otherwise, auto-detect based on layout constraints
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > constraints.maxHeight) {
          // Parent is likely a Row
          return SizedBox(width: adjustedSpace);
        } else {
          // Parent is likely a Column
          return SizedBox(height: adjustedSpace);
        }
      },
    );
  }

  /// Calculate a responsive factor based on screen width
  double _getResponsiveFactor(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 360) {
      return 0.8; // Smaller spacing on very small devices
    } else if (screenWidth < 600) {
      return 1.0; // Base spacing for phones
    } else if (screenWidth < 900) {
      return 1.2; // Slightly larger for tablets
    } else {
      return 1.5; // Larger spacing for desktops/large tablets
    }
  }
}

/// Enum defining the type of spacing
enum SpacerType {
  /// Horizontal spacing (width)
  horizontal,
  
  /// Vertical spacing (height)
  vertical,
  
  /// Both horizontal and vertical spacing
  both,
}

/// Example usage:
///
/// Row(
///   children: [
///     Text('First item'),
///     Spacer.medium(), // Auto-detected as horizontal in Row
///     Text('Second item'),
///   ],
/// )
///
/// Column(
///   children: [
///     Text('First item'),
///     Spacer.medium(), // Auto-detected as vertical in Column
///     Text('Second item'),
///     Spacer.horizontal(space: 16), // Force horizontal even in Column
///   ],
/// )