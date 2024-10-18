import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:insta_med_ui/provider/LocaleProvider.dart';
import 'theme/theme.dart';
import 'utils/routes.dart';
import 'provider/HistoryProvider.dart';

const String firebaseProjectId = 'mental-health-20c6f';
const String firebaseAppId = '1:172484400804:android:7f0927324d64080f5fb831';
const String firebaseApiKey = 'AIzaSyDC7wKUJy0GxN0prZk_2xnspBJKNkYjqWA';
const String firebaseStorageBucket = 'mental-health-20c6f.appspot.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: firebaseApiKey,
      appId: firebaseAppId,
      messagingSenderId: firebaseProjectId,
      projectId: firebaseProjectId,
      storageBucket: firebaseStorageBucket,
    ),
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HistoryProvider()),
            ChangeNotifierProvider(
                create: (_) => LocaleProvider()), // Add LocaleProvider here
          ],
          child: const InstaMedApp(),
        ),
      ),
    ),
  );
}

class InstaMedApp extends StatelessWidget {
  const InstaMedApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      locale: localeProvider.locale, // Use the locale from LocaleProvider
      supportedLocales: L10n.all, // Ensure the supported locales are used
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

class L10n {
  static final all = [
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
  ];
}
