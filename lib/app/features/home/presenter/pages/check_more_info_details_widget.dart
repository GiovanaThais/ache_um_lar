import 'package:flutter/material.dart';

class CheckMoreInfoDetailsWidget extends StatefulWidget {
  final List<String> imovelDetails;
  final List<String> condominiumDetails;

  const CheckMoreInfoDetailsWidget({
    Key? key,
    required this.imovelDetails,
    required this.condominiumDetails,
  }) : super(key: key);

  @override
  _CheckMoreInfoWidgetState createState() => _CheckMoreInfoWidgetState();
}

class _CheckMoreInfoWidgetState extends State<CheckMoreInfoDetailsWidget> {
  bool showImovelDetails = false;
  bool showCondominiumDetails = false;

  late List<bool> imovelCheckedList;
  late List<bool> condominiumCheckedList;

  @override
  void initState() {
    super.initState();
    imovelCheckedList = List.filled(widget.imovelDetails.length, false);
    condominiumCheckedList =
        List.filled(widget.condominiumDetails.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showImovelDetails = !showImovelDetails;
              if (showImovelDetails) {
                showCondominiumDetails = false;
              }
            });
          },
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.home), // Adicionei o ícone aqui
                SizedBox(width: 8),
                Text("Detalhes do Imóvel"),
              ],
            ),
          ),
        ),
        if (showImovelDetails)
          for (int i = 0; i < widget.imovelDetails.length; i++)
            Row(
              children: [
                Checkbox(
                  value: imovelCheckedList[i],
                  onChanged: (value) {
                    setState(() {
                      imovelCheckedList[i] = value ?? false;
                    });
                  },
                ),
                SizedBox(width: 8),
                Text(widget.imovelDetails[i]),
              ],
            ),
        GestureDetector(
          onTap: () {
            setState(() {
              showCondominiumDetails = !showCondominiumDetails;
              if (showCondominiumDetails) {
                showImovelDetails = false;
              }
            });
          },
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.apartment), // Adicionei o ícone aqui
                SizedBox(width: 8),
                Text("Detalhes do Condomínio"),
              ],
            ),
          ),
        ),
        if (showCondominiumDetails)
          for (int i = 0; i < widget.condominiumDetails.length; i++)
            Row(
              children: [
                Checkbox(
                  value: condominiumCheckedList[i],
                  onChanged: (value) {
                    setState(() {
                      condominiumCheckedList[i] = value ?? false;
                    });
                  },
                ),
                SizedBox(width: 8),
                Text(widget.condominiumDetails[i]),
              ],
            ),
      ],
    );
  }
}
