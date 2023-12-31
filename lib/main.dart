import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/bindings/add_binding.dart';
import 'package:note_app/bindings/auth_binding.dart';
import 'package:note_app/bindings/dashboard_binding.dart';
import 'package:note_app/bindings/home_binding.dart';
import 'package:note_app/bindings/splash_binding.dart';
import 'package:note_app/core/app_routes.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:note_app/firebase_options.dart';
import 'package:note_app/pages/add_page.dart';
import 'package:note_app/pages/dashboard_page.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:note_app/pages/login_page.dart';
import 'package:note_app/pages/sign_up_page.dart';
import 'package:note_app/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(
            name: AppRoutes.splash,
            page: () => SplashPage(),
            binding: SplashBinding()),
        GetPage(name: AppRoutes.dashboard, page: ()=>DashboardPage(),binding:DashboardBinding()),
        GetPage(
            name: AppRoutes.home,
            page: () => HomePage(),
            binding: HomeBinding()),
        GetPage(
            name: AppRoutes.login,
            page: () => LoginPage(),
            binding: AuthBinding()),
        GetPage(
            name: AppRoutes.signUp,
            page: () => SignUpPage(),
            binding: AuthBinding()),
        GetPage(
            name: AppRoutes.addPage,
            page: () => AddPage(),
            binding: AddBinding()),
      ],
    );
  }
}
