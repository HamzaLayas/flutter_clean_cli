// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} day ago', few: '${count} days ago', many: '${count} days ago', other: '${count} days ago')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} hour ago', few: '${count} hours ago', many: '${count} hours ago', other: '${count} hours ago')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} minute ago', few: '${count} minutes ago', many: '${count} minutes ago', other: '${count} minutes ago')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} month ago', few: '${count} months ago', many: '${count} months ago', other: '${count} months ago')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} week ago', few: '${count} weeks ago', many: '${count} weeks ago', other: '${count} weeks ago')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Just now', one: '${count} year ago', few: '${count} years ago', many: '${count} years ago', other: '${count} years ago')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "daysAgo": m0,
    "deviceSettings": MessageLookupByLibrary.simpleMessage("Device Settings"),
    "display": MessageLookupByLibrary.simpleMessage("Display"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "goBackHome": MessageLookupByLibrary.simpleMessage("Go back!"),
    "hoursAgo": m1,
    "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm password does not match password",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters long",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number 09X XXX XXXX",
    ),
    "invalidUsername": MessageLookupByLibrary.simpleMessage(
      "Username must be at least 3 characters long",
    ),
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "minutesAgo": m2,
    "monthsAgo": m3,
    "noFavorites": MessageLookupByLibrary.simpleMessage("No favorites"),
    "noFavoritesDescription": MessageLookupByLibrary.simpleMessage(
      "No saved favorites",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("No history"),
    "noHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "No saved history",
    ),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "noInternetDescription": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection",
    ),
    "noNotifications": MessageLookupByLibrary.simpleMessage("No notifications"),
    "noNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "No new notifications",
    ),
    "noResults": MessageLookupByLibrary.simpleMessage("No results"),
    "noResultsDescription": MessageLookupByLibrary.simpleMessage(
      "No results matching your search",
    ),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "No search results",
    ),
    "noSearchResultsDescription": MessageLookupByLibrary.simpleMessage(
      "No results matching your search",
    ),
    "pageNotFound": MessageLookupByLibrary.simpleMessage("Page not found"),
    "pressAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Press again to exit",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "slowInternet": MessageLookupByLibrary.simpleMessage(
      "Slow internet connection",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, please try again.",
    ),
    "weeksAgo": m4,
    "yearsAgo": m5,
  };
}
