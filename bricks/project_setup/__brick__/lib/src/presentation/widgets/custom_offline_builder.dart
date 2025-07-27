import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/utilities/extensions/context_extension.dart';
import '../../../generated/l10n.dart';

class CustomOfflineBuilder extends StatelessWidget {
  const CustomOfflineBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, connectivity, child) {
        if (!connectivity.contains(ConnectivityResult.none))
        // && state is! ConnectionTimeOut)
        {
          return child;
        }
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  context.colorScheme.brightness == Brightness.light
                      ? 'assets/svgs/lost_connection.svg'
                      : 'assets/svgs/dark_lost_connection.svg',
                  width: 429.w,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 32.h, bottom: 4.h),
                  child: Text(
                    S.of(context).noInternet,
                    style: context.textTheme.displaySmall!.copyWith(
                      color: context.colorScheme.onSecondary,
                    ),
                  ),
                ),
                Text(
                  S.of(context).noInternetDescription,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.onSecondary,
                  ),
                ),
                // if (state is ConnectionTimeOut)
                //   Padding(
                //     padding: EdgeInsetsDirectional.only(top: 32.h),
                //     child: ElevatedButton(
                //       onPressed: () =>
                //           context.read<AuthCubit>().reconnectedToInternet(),
                //       style: ElevatedButton.styleFrom(
                //         minimumSize: Size(120.w, 50.h),
                //       ),
                //       child: Text(
                //         S.of(context).retry,
                //         style: context.textTheme.headlineLarge?.copyWith(
                //           color: context.colorScheme.onPrimary,
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        );
      },
      child: child,
    );
  }
}
