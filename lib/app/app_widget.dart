import 'package:ache_um_lar/app/app_controller.dart';
import 'package:ache_um_lar/app/core/theme/app_theme.dart';
import 'package:ache_um_lar/app/core/theme/light/light_colors.dart';
import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:ache_um_lar/app/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AppController>();

    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, state, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Color(0xffffccff),
                  tertiary: Color(0xffac99bf),
                  brightness: Brightness.light,
                )),
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Color(0xffffccff),
                  tertiary: Color(0xffac99bf),
                  brightness: Brightness.dark,
                )),
            home: const HomePage(
              title: 'Immoble',
            ),
          );
        });
  }
}
