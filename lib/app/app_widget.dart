import 'package:ache_um_lar/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AppController>();

    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, state, child) {
          return MaterialApp.router(
            routerConfig: Modular.routerConfig,
            title: 'MyImmoble',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xffffccff),
                  tertiary: const Color(0xffac99bf),
                  //shadow: Color.fromARGB(255, 207, 83, 174),
                  brightness: Brightness.light,
                )),
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xffffccff),
                  tertiary: const Color(0xffac99bf),
                  //shadow: Color.fromARGB(255, 152, 29, 119),
                  brightness: Brightness.dark,
                )),
          );
        });
  }
}
