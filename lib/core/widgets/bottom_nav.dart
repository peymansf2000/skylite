import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required PageController controller,
  }) : _controller = controller;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      elevation: 0,
      onTap: (value) => _controller.animateToPage(value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'bookmarks')
      ],
    );
  }
}
