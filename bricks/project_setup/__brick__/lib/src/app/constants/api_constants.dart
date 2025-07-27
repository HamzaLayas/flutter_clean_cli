import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static String kBaseUrl = dotenv.env['BASE_URL'] ?? '';

  // user
  static String kGetUser = 'user_profile';
} 