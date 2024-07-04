import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/theme.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import 'package:jobsque/view_model/routes/routes.dart';
import 'model/bloc_observer.dart';
import 'model/cubit/app_cubit.dart';
import 'model/cubit/auth_cubit.dart';
import 'model/dio_helper.dart';
import 'model/shared/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..getJob()),
        BlocProvider(create: (context) => AuthCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JOBSQUE',
        theme: CustomThemes.lightTheme,
        onGenerateRoute: onGenerate,
        initialRoute: AppRouter.homeScreen,
      ),
    );
  }
}
