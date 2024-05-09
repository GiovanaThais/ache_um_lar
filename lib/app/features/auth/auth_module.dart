import 'package:ache_um_lar/app/features/auth/login/login_page.dart';
import 'package:ache_um_lar/app/features/auth/registers/register_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login/forgot_password_page.dart';
import 'registers/registerCompany/register_company_page.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/login', child: (context) => LoginPage());
    r.child('/registerUser', child: (context) => RegisterUserPage());
    r.child('/registerCompany', child: (context) => RegisterCompanyPage());
    r.child('/resetPassword', child: (context) => ForgetPasswordPage());
  }
}
