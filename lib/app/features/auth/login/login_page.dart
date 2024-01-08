import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/wave_clipper.dart';

/*
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool isObscureText = true;

  void navigateToHomePage() {
    Modular.to.pop();
    //ScaffoldMessenger.of(context)
    //    .showSnackBar(const SnackBar(content: Text("Erro ao efetuar login")));
  }

  void navigateToRegisterPage() {
    Modular.to.pushNamed('/auth/registerUser');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.onPrimary,
                        ],
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/icons/logo3.png',
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Seja bem-vindo ao Immoble!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Já possui conta? Identifique-se ",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          //children: [
                          decoration: InputDecoration(
                              hintText: "Insira seu email",
                              hintStyle:
                                  TextStyle(color: theme.colorScheme.primary),
                              prefixIcon: Icon(
                                Icons.person,
                                color: theme.colorScheme.primary,
                              )),
                          //Expanded(flex: 4, child: Text("Informe seu email:")),
                          // Expanded(flex: 4, child: Text('Email'))
                          //],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          obscureText: isObscureText,
                          onChanged: (value) {
                            password = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Insira sua senha",
                              hintStyle:
                                  TextStyle(color: theme.colorScheme.primary),
                              prefixIcon: Icon(
                                Icons.key,
                                color: theme.colorScheme.primary,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: theme.colorScheme.primary,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              navigateToHomePage();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  theme.colorScheme.primary),
                            ),
                            child: const Text(
                              "Entrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              "Esqueci minha senha",
                              style:
                                  TextStyle(color: theme.colorScheme.primary),
                            ),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary),
                            ),
                          ),
                          onTap: () {
                            navigateToRegisterPage();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool isObscureText = true;

  void navigateToHomePage() {
    Modular.to.pop();
    //ScaffoldMessenger.of(context)
    //    .showSnackBar(const SnackBar(content: Text("Erro ao efetuar login")));
  }

  void navigateToRegisterPage() {
    Modular.to.pushNamed('/auth/registerUser');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height,
            ),
            child: Column(
              children: [
                headerMethod(size),
                Expanded(
                  flex: 55,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        registerEmailMethod(),
                        const SizedBox(
                          height: 12,
                        ),
                        registerPasswordMethod(),
                        const SizedBox(
                          height: 10,
                        ),
                        footerPageMethod(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField registerPasswordMethod() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return TextField(
      obscureText: isObscureText,
      onChanged: (value) {
        password = value;
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: "Insira sua senha",
          hintStyle: TextStyle(color: theme.colorScheme.primary),
          prefixIcon: Icon(
            Icons.key,
            color: theme.colorScheme.primary,
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              color: theme.colorScheme.primary,
            ),
          )),
    );
  }

  TextField registerEmailMethod() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return TextField(
      onChanged: (value) {
        email = value;
      },
      style: const TextStyle(color: Colors.black),
      //children: [
      decoration: InputDecoration(
          hintText: "Insira seu email",
          hintStyle: TextStyle(color: theme.colorScheme.primary),
          prefixIcon: Icon(
            Icons.person,
            color: theme.colorScheme.primary,
          )),
      //Expanded(flex: 4, child: Text("Informe seu email:")),
      // Expanded(flex: 4, child: Text('Email'))
      //],
    );
  }

  Expanded footerPageMethod() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                navigateToHomePage();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:
                    MaterialStateProperty.all(theme.colorScheme.primary),
              ),
              child: const Text(
                "Entrar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          // Expanded(child: Container()), não entendi esse container
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                "Esqueci minha senha",
                style: TextStyle(color: theme.colorScheme.primary),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
            ),
            onTap: () {
              navigateToRegisterPage();
            },
          ),
        ],
      ),
    );
  }

  Expanded headerMethod(Size size) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      flex: 45,
      child: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.onPrimary,
                theme.colorScheme.primary,
              ],
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo3.png',
                  width: 0.55 * size.width,
                  height: 0.25 * size.height,
                ),
                SizedBox(
                  height: 0.01 * size.height,
                ),
                const Text("Seja bem-vindo a Immoble!",
                    //"APP_SUB_TITLE".tr(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: 0.01 * size.height,
                ),
                const Text(
                  "Já possui conta? Identifique-se ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
