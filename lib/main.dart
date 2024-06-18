import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/theme.dart';
import 'package:jobsque/view/splash_screen.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import 'package:jobsque/view_model/routes/routes.dart';
import 'model/bloc_observer.dart';
import 'model/cubit/app_cubit.dart';
import 'model/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        title: 'JOBSQUE',
        home: SplashScreen(),
        onGenerateRoute: onGenerate,
        initialRoute: AppRouter.login,
      ),
    );
  }
}
