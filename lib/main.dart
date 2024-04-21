import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:okaz_souq/core/bloc/cubit/global_cubit.dart';
import 'package:okaz_souq/core/bloc/cubit/global_state.dart';
import 'package:okaz_souq/core/bloc/services/service_locator.dart';
import 'package:okaz_souq/core/database/cache/cache_helper.dart';
import 'package:okaz_souq/core/locale/app_loacl.dart';
import 'package:okaz_souq/core/shared/helpers/singleton_initializer.dart';
import 'package:okaz_souq/core/shared/styles/my_colors.dart';
import 'features/splash/pages/splash_page.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();
  SingletonInitializer().initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
    create: (context) => sl<GlobalCubit>()..getCachedLang(),
    child: const MyApp(),
  ));
}

//test
//test 2 branch
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return GetMaterialApp(
          title: 'Okaz Souq',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
            appBarTheme: const AppBarTheme(
              color: MyColors.secondaryColor,
            ),
            scaffoldBackgroundColor: MyColors.secondaryColor,
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate,
            DefaultMaterialLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ar', "EG"),
            Locale('en', "US"),
          ],
          locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
          home: const SplashPage(),
        );
      },
    );
  }
}
