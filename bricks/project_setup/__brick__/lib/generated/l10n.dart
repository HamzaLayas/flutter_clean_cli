// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Just now`
  String get justNow {
    return Intl.message('Just now', name: 'justNow', desc: '', args: []);
  }

  /// `{count, plural, =0 {Just now} one {{count} minute ago} few {{count} minutes ago} many {{count} minutes ago} other {{count} minutes ago}}`
  String minutesAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count minute ago',
      few: '$count minutes ago',
      many: '$count minutes ago',
      other: '$count minutes ago',
      name: 'minutesAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0 {Just now} one {{count} hour ago} few {{count} hours ago} many {{count} hours ago} other {{count} hours ago}}`
  String hoursAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count hour ago',
      few: '$count hours ago',
      many: '$count hours ago',
      other: '$count hours ago',
      name: 'hoursAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0 {Just now} one {{count} day ago} few {{count} days ago} many {{count} days ago} other {{count} days ago}}`
  String daysAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count day ago',
      few: '$count days ago',
      many: '$count days ago',
      other: '$count days ago',
      name: 'daysAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0 {Just now} one {{count} week ago} few {{count} weeks ago} many {{count} weeks ago} other {{count} weeks ago}}`
  String weeksAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count week ago',
      few: '$count weeks ago',
      many: '$count weeks ago',
      other: '$count weeks ago',
      name: 'weeksAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0 {Just now} one {{count} month ago} few {{count} months ago} many {{count} months ago} other {{count} months ago}}`
  String monthsAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count month ago',
      few: '$count months ago',
      many: '$count months ago',
      other: '$count months ago',
      name: 'monthsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0 {Just now} one {{count} year ago} few {{count} years ago} many {{count} years ago} other {{count} years ago}}`
  String yearsAgo(num count) {
    return Intl.plural(
      count,
      zero: 'Just now',
      one: '$count year ago',
      few: '$count years ago',
      many: '$count years ago',
      other: '$count years ago',
      name: 'yearsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `Something went wrong, please try again.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternet {
    return Intl.message(
      'No internet connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get noInternetDescription {
    return Intl.message(
      'Please check your internet connection',
      name: 'noInternetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Slow internet connection`
  String get slowInternet {
    return Intl.message(
      'Slow internet connection',
      name: 'slowInternet',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message('No results', name: 'noResults', desc: '', args: []);
  }

  /// `No results matching your search`
  String get noResultsDescription {
    return Intl.message(
      'No results matching your search',
      name: 'noResultsDescription',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get noNotifications {
    return Intl.message(
      'No notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No new notifications`
  String get noNotificationsDescription {
    return Intl.message(
      'No new notifications',
      name: 'noNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `No favorites`
  String get noFavorites {
    return Intl.message(
      'No favorites',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `No saved favorites`
  String get noFavoritesDescription {
    return Intl.message(
      'No saved favorites',
      name: 'noFavoritesDescription',
      desc: '',
      args: [],
    );
  }

  /// `No history`
  String get noHistory {
    return Intl.message('No history', name: 'noHistory', desc: '', args: []);
  }

  /// `No saved history`
  String get noHistoryDescription {
    return Intl.message(
      'No saved history',
      name: 'noHistoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `No search results`
  String get noSearchResults {
    return Intl.message(
      'No search results',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `No results matching your search`
  String get noSearchResultsDescription {
    return Intl.message(
      'No results matching your search',
      name: 'noSearchResultsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Go back!`
  String get goBackHome {
    return Intl.message('Go back!', name: 'goBackHome', desc: '', args: []);
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 3 characters long`
  String get invalidUsername {
    return Intl.message(
      'Username must be at least 3 characters long',
      name: 'invalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number 09X XXX XXXX`
  String get invalidPhone {
    return Intl.message(
      'Please enter a valid number 09X XXX XXXX',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get invalidPassword {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match password`
  String get invalidConfirmPassword {
    return Intl.message(
      'Confirm password does not match password',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Display`
  String get display {
    return Intl.message('Display', name: 'display', desc: '', args: []);
  }

  /// `Device Settings`
  String get deviceSettings {
    return Intl.message(
      'Device Settings',
      name: 'deviceSettings',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
