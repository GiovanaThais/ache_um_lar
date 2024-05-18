import 'package:ache_um_lar/app/features/home/presenter/pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../submodules/details/widgets/bottom_buttons.dart';
import '../widgets/alter_hour_visit_afternoon_widget.dart';
import '../widgets/alter_hour_visit_bottom_sheet_widget.dart';

class VisitHomePage extends StatefulWidget {
  @override
  State<VisitHomePage> createState() => _VisitHomePageState();
}

class _VisitHomePageState extends State<VisitHomePage> {
  DateTime today = DateTime.now();
  String groupValue = "08:00";

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
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
                      Text("Dia da visita: " +
                          '' +
                          today.day.toString() +
                          '/' +
                          today.month.toString()),
                      TableCalendar(
                        calendarStyle: CalendarStyle(
                            markerDecoration:
                                BoxDecoration(color: theme.colorScheme.primary),
                            rangeHighlightColor: theme.colorScheme.primary,
                            todayDecoration: BoxDecoration(
                              color: theme.colorScheme.tertiary,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                shape: BoxShape.circle)),
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
                        showAlterHourBottomSheet(context);
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
                        showAlterHourBottomSheetAfternoon(context);
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/chat');
                  },
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

void showAlterHourBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    context: context,
    builder: (BuildContext bc) {
      return const AlterHourVisitBottomSheetWidget();
    },
  );
}

void showAlterHourBottomSheetAfternoon(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    context: context,
    builder: (BuildContext bc) {
      return AlterHourVisitAfternoonBottomSheetWidget();
    },
  );
}
