import 'package:desktop_sidebar/features/home/screens/home.dart';
import 'package:desktop_sidebar/src/hide_scroll_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop Sidebar',
      scrollBehavior: HideScrollBar().copyWith(scrollbars: false),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(
          background: const Color(0xffE9EEF2),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
