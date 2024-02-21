import 'package:ache_um_lar/app/features/home/presenter/pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../submodules/details/widgets/bottom_buttons.dart';

class VisitHomePage extends StatelessWidget {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState() {
      today = day;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendar Visita"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Escolha um dia",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Dia da visita: " + today.toString().split("")[0]),
                      TableCalendar(
                        locale: "en_US",
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2024, 2, 01),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: _onDaySelected,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Escolha um périodo de horário",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListTile(
                      leading: const Icon(Icons.timer, color: Colors.purple),
                      title: const Text("08:00hrs -- 11:00hrs"),
                      hoverColor: theme.colorScheme.primary,
                      splashColor: theme.colorScheme.primary,
                      selectedColor: theme.colorScheme.primary,
                      focusColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.primary,
                      onTap: () {
                        alterCountryMethod(
                          context,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListTile(
                      leading:
                          const Icon(Icons.timelapse, color: Colors.purple),
                      title: const Text("13:00hrs -- 18:00hrs"),
                      hoverColor: theme.colorScheme.primary,
                      splashColor: theme.colorScheme.primary,
                      selectedColor: theme.colorScheme.primary,
                      focusColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.primary,
                      onTap: () {
                        alterCountryMethod(
                          context,
                        );
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Pedir encaixe de outra data ou horário"),
                  //style: ButtonStyle(shadowColor: theme.colorScheme.primary),
                ),
                //const BottomButtons(),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Solicitar visita"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> alterCountryMethod(
  BuildContext context,
) {
  bool isBrazilSelected = false;
  bool isMexicoSelected = false;
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (BuildContext bc) {
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
                  height: 20,
                ),
                const Text(
                  " Qual horário você deseja visitar o imovél?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("08:00hrs - 09:00hrs"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isMexicoSelected,
                      onChanged: (bool? value) {
                        // Handle Mexico checkbox change
                        isMexicoSelected = value ?? false;
                      },
                    ),
                    const Text("09:00hrs - 10:00hrs"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("10:00hrs - 11:00hrs"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("14:00hrs - 15:00hrs"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("16:00hrs - 17:00hrs"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("17:00hrs - 18:00hrs"),
                  ],
                ),
              ],
            ));
      });
}
