import 'package:flutter/material.dart';

class CheckMoreInfoWidget extends StatefulWidget {
  final String title;
  final List<String> detailsList;

  const CheckMoreInfoWidget({
    Key? key,
    required this.title,
    required this.detailsList,
  }) : super(key: key);

  @override
  _CheckMoreInfoWidgetState createState() => _CheckMoreInfoWidgetState();
}

class _CheckMoreInfoWidgetState extends State<CheckMoreInfoWidget> {
  bool isChecked = false;

  // Listas de opções específicas para imóvel e condomínio
  static List<String> imovelDetails = [
    'Área de serviço',
    'Armários no quarto',
    'Armários na cozinha',
    'Mobiliado',
    'Ar condicionado',
    'Churrasqueira',
    'Varanda',
    'Academia',
    'Piscina',
    'Quarto de serviço',
  ];

  static List<String> condominiumDetails = [
    'Condomínio fechado',
    'Elevador',
    'Segurança 24h',
    'Portaria',
    'Permitido animais',
    'Academia (cond.)',
    'Piscina (cond.)',
    'Salão de festas',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        const SizedBox(width: 8),
        Text(widget.title),
      ],
    );
  }
}
