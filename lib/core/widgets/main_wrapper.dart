import 'package:flutter/material.dart';
import 'package:skylite/core/widgets/bottom_nav.dart';
import 'package:skylite/features/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:skylite/features/weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> screens = const [HomeScreen(), BookmarkScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'))),
          child: PageView(
            controller: _controller,
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNav(controller: _controller),
      ),
    );
  }
}
