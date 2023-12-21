import 'package:ache_um_lar/app/core/theme/app_theme.dart';
import 'package:ache_um_lar/app/core/theme/light/light_colors.dart';
import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:ache_um_lar/app/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.light),
      home: const HomePage(
        title: 'Immoble',
      ),
    );
  }
}
