import 'package:ache_um_lar/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => AppController());
  }
}
