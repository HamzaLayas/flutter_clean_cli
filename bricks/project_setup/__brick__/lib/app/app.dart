import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/generated/l10n.dart';
import 'routing/app_router.dart';
import 'styles/app_theme.dart';
import 'styles/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(429, 932),
      child: MaterialApp.router(
        routerConfig: AppRouter.routes,
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: AppTheme.themeData.copyWith(
          colorScheme: AppColors.lightColorScheme,
        ),
        darkTheme: AppTheme.themeData.copyWith(
          colorScheme: AppColors.darkColorScheme,
        ),
        locale: locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
