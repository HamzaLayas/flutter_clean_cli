import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'Alexandria',
    menuTheme: MenuThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.all(10),
        padding: WidgetStateProperty.all(EdgeInsetsDirectional.all(20.r)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.onPrimary,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w600,
        color: AppColors.onPrimary,
      ),
      actionsPadding: EdgeInsetsDirectional.only(end: 12.w),
      actionsIconTheme: IconThemeData(size: 22.sp),
      iconTheme: IconThemeData(size: 22.sp),
    ),
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.comfortable,
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.pressed) ||
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.selected)) {
          return BorderSide(color: AppColors.tertiary, width: 2.w);
        }
        return BorderSide(color: AppColors.outline, width: 2.w);
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      fillColor: WidgetStateProperty.all(Colors.transparent),
      checkColor: WidgetStateProperty.all(AppColors.tertiary),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: AppColors.tertiary, width: 2.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: AppColors.tertiary, width: 1.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: AppColors.error, width: 2.w),
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w400,
        color: AppColors.error,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: Size(double.infinity, 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Alexandria',
          fontWeight: FontWeight.w600,
          color: AppColors.onPrimary,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(double.infinity, 52.h),
        side: BorderSide(
          width: 1.w,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Alexandria',
          fontWeight: FontWeight.w500,
          color: AppColors.secondary,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.tertiary,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Alexandria',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        disabledBackgroundColor: Colors.transparent,
        foregroundColor: AppColors.tertiary,
        // backgroundColor: themeData.colorScheme.surfaceContainer,
        disabledForegroundColor: AppColors.tertiary,
        shape: CircleBorder(),
        visualDensity: VisualDensity.comfortable,
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
      displayMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        letterSpacing: -0.06.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        letterSpacing: -0.06.sp,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
      bodyMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData copyWith({ColorScheme? colorScheme}) {
    return themeData.copyWith(
      colorScheme: colorScheme ?? themeData.colorScheme,
    );
  }
}
