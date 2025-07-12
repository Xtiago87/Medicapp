import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/viewmodels/home/home_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = Modular.get<HomeViewmodel>();
    viewmodel.init();
  }

  String get saudacao {
    final hora = DateTime.now().hour;
    if (hora < 12) return 'Bom dia';
    if (hora < 18) return 'Boa tarde';
    return 'Boa noite';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<String>(
          valueListenable: viewmodel.username,
          builder: (_, nome, __) => Text('$saudacao, $nome'),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          if (viewmodel.isLoading.value)
            return const Center(child: CircularProgressIndicator());

          return Column(
            children: [
              TableCalendar(
                locale: 'pt_BR',
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: viewmodel.dataSelecionada,
                selectedDayPredicate: (day) =>
                    isSameDay(viewmodel.dataSelecionada, day),
                onDaySelected: (selectedDay, focusedDay) {
                  viewmodel.selecionarData(selectedDay);
                },
                calendarFormat: CalendarFormat.week,
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ValueListenableBuilder<List>(
                  valueListenable: viewmodel.meds,
                  builder: (_, meds, __) {
                    if (meds.isEmpty) {
                      return const Center(
                        child: Text('Nenhum medicamento para este dia.'),
                      );
                    }

                    return ListView.builder(
                      itemCount: meds.length,
                      itemBuilder: (_, index) {
                        final med = meds[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: ListTile(
                            onTap: () {
                              Modular.to.pushNamed('/main/detalhes_med/${med.id}');
                            },
                            leading: const Icon(Icons.medication),
                            title: Text(med.nome),
                            subtitle: Text(med.observacao ?? ''),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/main/med_form');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
