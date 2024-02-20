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
  List<String> imovelDetails = [
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

  List<String> condominiumDetails = [
    'Condomínio fechado',
    'Elevador',
    'Segurança 24h',
    'Portaria',
    'Quadra',
    'Permitido animais',
    'Academia (cond.)',
    'Piscina (cond.)',
    'Salão de festas',
  ];

  late List<bool> checkedList;

  @override
  void initState() {
    super.initState();
    checkedList = List.filled(widget.detailsList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        for (int i = 0; i < widget.detailsList.length; i++)
          Row(
            children: [
              Checkbox(
                value: checkedList[i],
                onChanged: (value) {
                  setState(() {
                    checkedList[i] = value ?? false;
                  });

                  // Notify parent about the changes
                },
              ),
              const SizedBox(width: 8),
              Text(widget.detailsList[i]),
            ],
          ),
      ],
    );
  }
}
