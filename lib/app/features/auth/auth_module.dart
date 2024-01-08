import 'package:ache_um_lar/app/features/auth/login/login_page.dart';
import 'package:ache_um_lar/app/features/auth/registers/register_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/login', child: (context) => LoginPage());
    r.child('/registerUser', child: (context) => RegisterUserPage());
  }
}
