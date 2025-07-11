import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final String userName = 'Tiago'; 
  List<String> medicamentosDoDia = []; 

  String get saudacao {
    final hora = DateTime.now().hour;
    if (hora < 12) return 'Bom dia';
    if (hora < 18) return 'Boa tarde';
    return 'Boa noite';
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _carregarMedicamentos(_selectedDay);
  }

  void _carregarMedicamentos(DateTime dia) {
    setState(() {
      // Aqui você buscaria no banco local
      medicamentosDoDia = dia.day == DateTime.now().day
          ? ['Dipirona 500mg', 'Vitamina C']
          : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$saudacao, $userName')),
      body: Column(
        children: [
          TableCalendar(
            locale: 'pt_BR',
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _carregarMedicamentos(selectedDay);
              });
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
            child: medicamentosDoDia.isEmpty
                ? const Center(
                    child: Text('Nenhum medicamento para este dia.'),
                  )
                : ListView.builder(
                    itemCount: medicamentosDoDia.length,
                    itemBuilder: (_, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.medication),
                          title: Text(medicamentosDoDia[index]),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main/form');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
