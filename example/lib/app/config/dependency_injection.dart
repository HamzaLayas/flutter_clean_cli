import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static final GetIt _sl = GetIt.instance;
  static late final SharedPreferences _prefs;
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.kBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<void> initApp() async {
    await dotenv.load(fileName: ".env");
    _prefs = await SharedPreferences.getInstance();

    final HydratedStorageDirectory storageDirectory;
    if (kIsWeb) {
      storageDirectory = HydratedStorageDirectory.web;
    } else {
      final dir = await getApplicationDocumentsDirectory();
      storageDirectory = HydratedStorageDirectory(dir.path);
    }
    final storage = await HydratedStorage.build(
      storageDirectory: storageDirectory,
    );
    HydratedBloc.storage = storage;

    // Initialize Firebase and FCM
    await initFirebase();
    // Dependencies
    _sl
      // BLoC Singletons
      ..registerLazySingleton(() => AuthCubit(
            getUser: _sl(),
            prefs: _sl(),
          ))
      // BLoC Factories
      ..registerFactory(() => UserSettingsCubit(
            getUser: _sl(),
            sharedPreferences: _sl(),
          ))
      // Use Cases
      ..registerLazySingleton(() => GetUser(_sl()))
      // Repositories
      ..registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(_sl()),
      )
      // Data Sources
      ..registerLazySingleton<ProfileDataSource>(
        () => ProfileDataSourceImpl(_sl()),
      )
      // External Dependencies
      ..registerLazySingleton<Dio>(() => _dio)
      ..registerLazySingleton<SharedPreferences>(() => _prefs);
    // Initialize CancelToken
    await initCancelToken();
    // Initialize API Interceptors
    _dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
      ),
      ApiInterceptor(
        dio: _dio,
        maxRetries: 3,
        retryDelay: const Duration(seconds: 2),
      ),
    ]);
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FCMConfig.init();
  }

  static Future<void> initCancelToken() async {
    if (_sl.isRegistered<CancelToken>()) {
      _sl.unregister<CancelToken>();
    }
    _sl.registerLazySingleton<CancelToken>(() => CancelToken());
  }
}
