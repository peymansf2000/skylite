import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';
import 'package:skylite/locator.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  await setup();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color systemColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    // Set the status bar color dynamically based on the theme primary color
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
