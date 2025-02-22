import 'package:care453/app_providers.dart';
import 'package:care453/core/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app_controllers.dart';
import 'features/Internet_Check/screens/internet_connection_overlay.dart';
import 'features/welcome/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: ApiKeys.supabaseUrl,
    anonKey: ApiKeys.supabaseUrl,
  );
  appControllers();
  runApp(
    MultiProvider(
      providers: appProviders,
      child: Directionality(
        textDirection: TextDirection.ltr, // Ensures text directionality
        child: InternetConnectionOverlay(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetConnectionOverlay(
      // Now wrapped inside GetMaterialApp
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 9, 140, 247)),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
