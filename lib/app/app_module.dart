import 'package:ache_um_lar/app/app_controller.dart';
import 'package:ache_um_lar/app/core/services/image_picker_service.dart';
import 'package:ache_um_lar/app/features/auth/auth_module.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/home_page.dart';
import 'package:ache_um_lar/app/features/home/submodules/chat/chat_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import 'features/home/submodules/register/controllers/add_homes_form_controller.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => AppController());
    i.add(() => ImagePicker());
    i.add<ImagePickerService>(() => ImagePickerServiceImpl(imagePicker: i()));
    i.addSingleton(() => AddHomesFormController(i()));
  }

  @override
  void routes(r) {
    r.module('/auth', module: AuthModule());
    r.child('/',
        child: (context) => const HomePage(
              title: "",
            ));
    r.child('/chat', child: (context) => const ChatPage());
  }
}
