import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../config/dependency_injection.dart';
import '../utilities/extensions/context_extension.dart';

String addCountryCode(String phoneNumber) =>
    phoneNumber.replaceFirst('0', '218');

Future<void> cancelAPIs(String reason) async {
  GetIt.I.get<CancelToken>().cancel(reason);
  await DependencyInjection.initCancelToken();
}

ShimmerEffect customShimmerEffect(
  BuildContext context, {
  Color? baseColor,
  Color? highlightColor,
}) => ShimmerEffect(
  baseColor: baseColor ?? context.colorScheme.shadow.withValues(alpha: 1),
  highlightColor: highlightColor ?? context.colorScheme.surface,
  duration: Duration(seconds: 1),
  begin: AlignmentDirectional.centerStart,
  end: AlignmentDirectional.centerEnd,
);
