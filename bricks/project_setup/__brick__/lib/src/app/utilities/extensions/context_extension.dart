import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/l10n.dart';
import '../../../presentation/widgets/custom_top_snack_bar.dart';

extension ContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  String formatDateTime(DateTime dateTime) {
    if (Localizations.localeOf(this).languageCode == 'ar') {
      return DateFormat('yyyy/MM/dd', 'en').format(dateTime);
    }
    return DateFormat('dd/MM/yyyy', 'en').format(dateTime);
  }

  void clearSnackBars() => ScaffoldMessenger.of(this).clearSnackBars();

  void showSnackBar({
    required String message,
    void Function()? action,
    int duration = 2,
  }) {
    clearSnackBars();
    showTopSnackBar(
      this,
      message: message,
      functionAfterDelay: action,
      durationInSeconds: duration,
    );
  }

  void launchUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showSnackBar(message: S.of(this).somethingWentWrong);
    }
  }
}
