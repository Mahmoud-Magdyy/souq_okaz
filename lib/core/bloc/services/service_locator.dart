


import 'package:get_it/get_it.dart';
import 'package:okaz_souq/core/bloc/cubit/global_cubit.dart';
import 'package:okaz_souq/core/database/cache/cache_helper.dart';

final sl=GetIt.instance;

Future<void> setupServiceLocator() async{
   sl.registerLazySingleton(() => CacheHelper());
   sl.registerLazySingleton(() => GlobalCubit());
}