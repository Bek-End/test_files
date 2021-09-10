import 'package:flutter/material.dart';
import 'package:test_file/bloc/global_bloc.dart';
import 'package:test_file/theme/app_colors.dart';

import 'screens/start_screen.dart';

void main() {
  stream = bloc.timeStream().listen((i) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test file',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.appBarBg),
      ),
      home: StartScreen(),
    );
  }
}
