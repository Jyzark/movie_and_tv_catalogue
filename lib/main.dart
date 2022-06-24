import 'package:flutter/material.dart';
import 'movie_page.dart';
import 'tvshows_page.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MoviePage(),
    TVShowsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              'assets/logo/logo.png',
              fit: BoxFit.contain,
              height: 24,
              isAntiAlias: true,
            ),
          ]),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex), //New
        ),
        extendBody: true,
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.amber,
          unselectedItemColor: const Color.fromARGB(255, 165, 126, 8),
          borderRadius: 300,
          itemBorderRadius: 300,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: [
            FloatingNavbarItem(icon: Icons.home),
            FloatingNavbarItem(icon: Icons.explore),
          ],
        ),
      ),
    );
  }
}
