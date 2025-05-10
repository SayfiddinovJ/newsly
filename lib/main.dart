import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/bloc/bookmark/bookmark_bloc.dart';
import 'package:newsly/bloc/news/news_bloc.dart';
import 'package:newsly/repositories/repository.dart';
import 'package:newsly/service/api_service.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:newsly/utils/theme/app_theme.dart';

import 'cubit/navigation_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NewsRepository(apiService: apiService),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationCubit()),
          BlocProvider(
            create: (context) => NewsBloc(context.read<NewsRepository>()),
          ),
          BlocProvider(
            create: (context) => BookmarkBloc(context.read<NewsRepository>()),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Newsly',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
