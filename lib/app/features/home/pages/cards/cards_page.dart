import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return MyHomePageWidget(title: '');
  }
}
