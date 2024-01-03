import 'package:ache_um_lar/app/app_module.dart';
import 'package:ache_um_lar/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(
    child: AppWidget(),
    module: AppModule(),
  ));
}
