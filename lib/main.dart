import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';
import 'package:skylite/locator.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  await setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar color dynamically based on the theme primary color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Theme.of(context).primaryColor,
        systemNavigationBarColor: Theme.of(context).primaryColor));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers: [BlocProvider(create: (_) => locator<HomeBloc>())],
            child: MainWrapper()));
  }
}
