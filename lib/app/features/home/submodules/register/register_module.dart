import 'package:ache_um_lar/app/features/home/submodules/register/controllers/add_homes_form_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.add(() => AddHomesFormController(i()));
  }
}
