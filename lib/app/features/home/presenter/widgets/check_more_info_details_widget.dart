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
  _CheckMoreInfoDetailsWidgetState createState() =>
      _CheckMoreInfoDetailsWidgetState();
}

class _CheckMoreInfoDetailsWidgetState
    extends State<CheckMoreInfoDetailsWidget> {
  bool showImovelDetails = false;
  bool showCondominiumDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.home),
              Text("Imóvel"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showImovelDetails = !showImovelDetails;
            });
          },
          child: Container(
            color: Colors.white10,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Detalhes do Imóvel",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(showImovelDetails
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                  ],
                ),
                if (showImovelDetails)
                  for (String detail in widget.imovelDetails) Text(detail),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.apartment),
              SizedBox(
                height: 2,
              ),
              Text("Condomínio"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showCondominiumDetails = !showCondominiumDetails;
            });
          },
          child: Container(
            color: Colors.white10,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Instalações do Condomínio",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(showCondominiumDetails
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                  ],
                ),
                if (showCondominiumDetails)
                  for (String detail in widget.condominiumDetails) Text(detail),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
