import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  String searchQuery = '';
  String selectedFilter = 'Todos';

  final List<String> filters = ['Todos', 'Tomando', 'Finalizado'];

  @override
  Widget build(BuildContext context) {
    // TODO: Conectar com ViewModel para pegar lista de medicamentos filtrada
    final medicamentos = [
      {'nome': 'Dipirona 500mg', 'status': 'Tomando'},
      {'nome': 'Vitamina C', 'status': 'Finalizado'},
      {'nome': 'Ibuprofeno', 'status': 'Tomando'},
    ].where((med) {
      final matchSearch = med['nome']!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchFilter = selectedFilter == 'Todos' || med['status'] == selectedFilter;
      return matchSearch && matchFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Medicamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Campo de busca
            TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar medicamento...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
            const SizedBox(height: 12),

            // 🧪 Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: filters.map((filter) {
                final isSelected = filter == selectedFilter;
                return ChoiceChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => selectedFilter = filter);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // 📋 Lista de medicamentos
            Expanded(
              child: medicamentos.isEmpty
                  ? const Center(child: Text('Nenhum medicamento encontrado.'))
                  : ListView.builder(
                      itemCount: medicamentos.length,
                      itemBuilder: (context, index) {
                        final med = medicamentos[index];
                        return Card(
                          child: ListTile(
                            title: Text(med['nome']!),
                            subtitle: Text('Status: ${med['status']}'),
                            leading: const Icon(Icons.medication),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
