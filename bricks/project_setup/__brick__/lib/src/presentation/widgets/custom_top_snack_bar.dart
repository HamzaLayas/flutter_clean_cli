import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utilities/extensions/context_extension.dart';

class CustomTopSnackBar {
  static OverlayEntry? _currentOverlay;
  static int _currentOverlayId = 0;

  static void dismiss() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

void showTopSnackBar(
  BuildContext context, {
  required String message,
  int durationInSeconds = 2,
  void Function()? functionAfterDelay,
  Color? backgroundColor,
  Color? textColor,
}) {
  final overlayId = ++CustomTopSnackBar._currentOverlayId;
  CustomTopSnackBar.dismiss();

  final overlay = Overlay.of(context);
  bool isVisible = false;

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isVisible ? 1.0 : 0.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(0, isVisible ? 0 : -50, 0),
            margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
              top: MediaQuery.paddingOf(context).top + 10.h,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Text(
                message,
                style: context.textTheme.titleMedium?.copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  CustomTopSnackBar._currentOverlay = overlayEntry;
  overlay.insert(overlayEntry);

  // Trigger the entrance animation
  WidgetsBinding.instance.addPostFrameCallback((_) {
    isVisible = true;
    overlayEntry.markNeedsBuild();
  });

  Future.delayed(Duration(seconds: durationInSeconds), () {
    if (overlayId == CustomTopSnackBar._currentOverlayId) {
      isVisible = false;
      overlayEntry.markNeedsBuild();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (overlayId == CustomTopSnackBar._currentOverlayId) {
          CustomTopSnackBar.dismiss();
          if (functionAfterDelay != null) {
            functionAfterDelay();
          }
        }
      });
    }
  });
}
