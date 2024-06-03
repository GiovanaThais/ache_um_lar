import 'package:ache_um_lar/app/app_controller.dart';
import 'package:ache_um_lar/app/core/services/image_picker_service.dart';
import 'package:ache_um_lar/app/features/auth/auth_module.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/help_page.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/home_page.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/settings_page.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/visit_home_page.dart';
import 'package:ache_um_lar/app/features/home/submodules/chat/chat_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import 'features/auth/service/prop_service.dart';
import 'features/home/submodules/register/add_homes_form_page.dart';
import 'features/home/submodules/register/controllers/add_homes_form_controller.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => AppController());
    i.add(() => ImagePicker());
    i.add(() => PropertyService());
    i.add<ImagePickerService>(() => ImagePickerServiceImpl(imagePicker: i()));
    i.add(() => AddHomesFormController(i()));
  }

  @override
  void routes(r) {
    r.module('/auth', module: AuthModule());
    r.child('/',
        child: (context) => const HomePage(
              title: "",
            ));
    r.child('/chat', child: (context) => const ChatPage());
    r.child('/visit', child: (context) => VisitHomePage());
    r.child('/help', child: (context) => HelpPage());
    r.child('/settings', child: (context) => SettingsPage());
    r.child('/editHome',
        child: (context) => AddHomesFormPage(
              model: r.args.data,
            ));
  }
}
