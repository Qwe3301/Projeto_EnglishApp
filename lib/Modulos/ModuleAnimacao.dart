import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ModuleAnimacao extends StatefulWidget {
  const ModuleAnimacao({super.key});

  @override
  State<ModuleAnimacao> createState() => _ModuleAnimacaoState();
}

class _ModuleAnimacaoState extends State<ModuleAnimacao> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    final sizeOfScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        IconButton(
            onPressed: () => setState(() {
                  isOpen = !isOpen;
                }),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 50,
            )),
        AnimatedContainer(
          width: sizeOfScreen.width - 10,
          height: isOpen ? 135 : 0,
          duration: const Duration(milliseconds: 200),
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  width: sizeOfScreen.width - 100,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TableCalendar(
                    focusedDay: today,
                    firstDay: DateTime.utc(2006, 2, 4),
                    lastDay: DateTime.utc(2030, 2, 13),
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) {
                        return "";
                      },
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                    ),
                    daysOfWeekVisible: false,
                    rowHeight: 30,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
