import 'package:ache_um_lar/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/widgets/custom_drawer_widget.dart';
import '../../submodules/favorites/pages/favorites_page.dart';
import 'realty_page.dart';
import '../../submodules/chat/chat_page.dart';
import '../../submodules/register/add_homes_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagePosition = 0;
  PageController controller = PageController(initialPage: 0);

  final pagesList = <Widget>[
    const CardPage(),
    const AddHomesFormPage(),
    const ChatPage(),
    const FavoritesPage(),
  ];

  final navigationBarList = const [
    BottomNavigationBarItem(label: "Casas", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Anunciar", icon: Icon(Icons.add)),
    BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat_sharp)),
    BottomNavigationBarItem(label: "Favoritos", icon: Icon(Icons.favorite)),
  ];

  @override
  Widget build(BuildContext context) {
    final appController = context.read<AppController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MyImmoble"),
          actions: [
            ValueListenableBuilder(
                valueListenable: appController,
                builder: (context, state, child) {
                  return Switch(
                      value: state.isDarkMode,
                      onChanged: (_) {
                        appController.changeThemeMode();
                      });
                })
          ],
        ),
        drawer: const CustomDrawerWidget(),
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              pagePosition = value;
            });
          },
          scrollDirection: Axis.vertical,
          children: pagesList,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: pagePosition,
            items: navigationBarList),
      ),
    );
  }
}
