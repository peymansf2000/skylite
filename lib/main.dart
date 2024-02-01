import 'package:flutter/material.dart';
import 'package:skylite/locator.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainWrapper());
  }
}
