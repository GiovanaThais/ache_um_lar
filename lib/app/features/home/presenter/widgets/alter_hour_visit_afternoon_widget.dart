import 'package:flutter/material.dart';

class AlterHourVisitAfternoonBottomSheetWidget extends StatefulWidget {
  const AlterHourVisitAfternoonBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _AlterHourVisitAfternoonBottomSheetWidgetState createState() =>
      _AlterHourVisitAfternoonBottomSheetWidgetState();

  void showAlterHourBottomSheet(BuildContext context) {}
}

class _AlterHourVisitAfternoonBottomSheetWidgetState
    extends State<AlterHourVisitAfternoonBottomSheetWidget> {
  String groupValue = "08:00";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          const Text(
            "Escolher um horário - Tarde",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            " Qual horário você deseja visitar o imóvel?",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Radio(
                value: "13:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("13:00hrs - 14:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "14:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("14:00hrs - 15:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "16:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("16:00hrs - 17:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "17:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("17:00hrs - 18:00hrs"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Coloque aqui o código para lidar com a ação do botão OK
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
