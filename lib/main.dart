import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';
import 'package:skylite/locator.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  runApp(
    const MyApp(),
  );
  await setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color systemColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: systemColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: systemColor,
        systemNavigationBarColor: systemColor));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => locator<HomeBloc>())],
          child: MainWrapper()),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
