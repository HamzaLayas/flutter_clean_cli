import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static String kBaseUrl = dotenv.env['BASE_URL'] ?? '';

  // user
  static String kUserProfile = 'user_profile';
}
