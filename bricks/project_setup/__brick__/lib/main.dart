import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'src/app/app.dart';
import 'src/app/config/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RendererBinding.instance.ensureSemantics();
  await ScreenUtil.ensureScreenSize();
  await DependencyInjection.initApp();
  usePathUrlStrategy();
  runApp(
    MyApp(),
  );
} 