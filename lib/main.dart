import 'package:flutter/material.dart';
import 'package:spotify/core/configs/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: AppTheme.lightTheme,
      home: MyHomePage(),
    );
  }
}

