import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:okaz_souq/core/shared/helpers/singleton_initializer.dart';
import 'package:okaz_souq/core/shared/styles/my_colors.dart';
import 'features/splash/pages/splash_page.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SingletonInitializer().initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
//test
//test 2 branch
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Okaz Souq',
      debugShowCheckedModeBanner:false,

      theme: ThemeData(
        textTheme:GoogleFonts.mulishTextTheme() ,
        appBarTheme: const AppBarTheme(
          color:  MyColors.secondaryColor,
        ),
        scaffoldBackgroundColor:  MyColors.secondaryColor,
      ),
      home: const SplashPage(),
    );
  }
}
