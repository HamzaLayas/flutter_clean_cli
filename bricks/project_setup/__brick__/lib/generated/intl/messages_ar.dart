// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ يوم', few: 'منذ ${count} أيام', many: 'منذ ${count} يوم', other: 'منذ ${count} أيام')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ ساعة', few: 'منذ ${count} ساعات', many: 'منذ ${count} ساعة', other: 'منذ ${count} ساعات')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ دقيقة', few: 'منذ ${count} دقائق', many: 'منذ ${count} دقيقة', other: 'منذ ${count} دقائق')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ شهر', few: 'منذ ${count} أشهر', many: 'منذ ${count} شهر', other: 'منذ ${count} أشهر')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ أسبوع', few: 'منذ ${count} أسابيع', many: 'منذ ${count} أسبوع', other: 'منذ ${count} أسابيع')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'الآن', one: 'منذ عام', few: 'منذ ${count} أعوام', many: 'منذ ${count} عام', other: 'منذ ${count} أعوام')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "darkMode": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
    "daysAgo": m0,
    "deviceSettings": MessageLookupByLibrary.simpleMessage("إعدادات الجهاز"),
    "display": MessageLookupByLibrary.simpleMessage("العرض"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "goBackHome": MessageLookupByLibrary.simpleMessage(
      "العودة إلى\nالصفحة الرئيسية!",
    ),
    "hoursAgo": m1,
    "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور لا يتطابق مع كلمة المرور",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "الرجاء إدخال بريد إلكتروني صالح",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "الرجاء إدخال رقم صالح 09X XXX XXXX",
    ),
    "invalidUsername": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون الأسم مكون من 3 أحرف على الأقل",
    ),
    "justNow": MessageLookupByLibrary.simpleMessage("الآن"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "lightMode": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
    "minutesAgo": m2,
    "monthsAgo": m3,
    "noFavorites": MessageLookupByLibrary.simpleMessage("لا توجد مفضلات"),
    "noFavoritesDescription": MessageLookupByLibrary.simpleMessage(
      "لا توجد مفضلات محفوظة",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("لا توجد سجلات"),
    "noHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "لا توجد سجلات محفوظة",
    ),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "noInternetDescription": MessageLookupByLibrary.simpleMessage(
      "تحقق من اتصالك بالإنترنت",
    ),
    "noNotifications": MessageLookupByLibrary.simpleMessage("لا توجد إشعارات"),
    "noNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات جديدة",
    ),
    "noResults": MessageLookupByLibrary.simpleMessage("لا توجد نتائج"),
    "noResultsDescription": MessageLookupByLibrary.simpleMessage(
      "لا توجد نتائج مطابقة لبحثك",
    ),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "لا توجد نتائج بحث",
    ),
    "noSearchResultsDescription": MessageLookupByLibrary.simpleMessage(
      "لا توجد نتائج مطابقة لبحثك",
    ),
    "pageNotFound": MessageLookupByLibrary.simpleMessage(
      "عذراً ! لم نتمكن من العثور على الصفحة",
    ),
    "pressAgainToExit": MessageLookupByLibrary.simpleMessage(
      "اضغط مرة أخرى للخروج",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "slowInternet": MessageLookupByLibrary.simpleMessage(
      "اتصال بطيء بالإنترنت",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "حصل خطأ ما، يرجى المحاولة مرة أخرى.",
    ),
    "weeksAgo": m4,
    "yearsAgo": m5,
  };
}
