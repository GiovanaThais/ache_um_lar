import 'package:flutter/material.dart';

class AlterHourVisitBottomSheetWidget extends StatefulWidget {
  const AlterHourVisitBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _AlterHourVisitBottomSheetWidgetState createState() =>
      _AlterHourVisitBottomSheetWidgetState();

  void showAlterHourBottomSheet(BuildContext context) {}
}

class _AlterHourVisitBottomSheetWidgetState
    extends State<AlterHourVisitBottomSheetWidget> {
  String groupValue = "08:00";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          const Text(
            "Escolher um horário",
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
                value: "08:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("08:00hrs - 09:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "09:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("09:00hrs - 10:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "10:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("10:00hrs - 11:00hrs"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "11:00",
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                },
              ),
              const Text("11:00hrs - 12:00hrs"),
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

  // void showAlterHourBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     context: context,
  //     builder: (BuildContext bc) {
  //       return AlterHourVisitBottomSheetWidget();
  //     },
  //   );
  // }
}
