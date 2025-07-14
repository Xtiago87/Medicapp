import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/viewmodels/historico/historico_viewmodel.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late HistoricoViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<HistoricoViewmodel>();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Medicamentos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar medicamento...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: viewModel.setSearchQuery,
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: viewModel.filters.map((filter) {
                final isSelected = filter == viewModel.selectedFilter;
                return ChoiceChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (_) =>
                      setState(() => viewModel.setFilter(filter)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            ValueListenableBuilder<bool>(
              valueListenable: viewModel.isLoading,
              builder: (_, isLoading, __) {
                if (isLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return ValueListenableBuilder<List<MedicacaoEntity>>(
                  valueListenable: viewModel.meds,
                  builder: (_, meds, __) {
                    if (meds.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text('Nenhum medicamento encontrado.'),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: meds.length,
                        itemBuilder: (context, index) {
                          final med = meds[index];
                          return Card(
                            child: ListTile(
                              leading: const Icon(Icons.medication),
                              title: Text(med.nome),
                              subtitle: Text(med.observacao),
                              onTap: () async {
                                final result =
                                    await Modular.to.pushNamed(
                                          '/main/detalhes_med/${med.id}',
                                        )
                                        as bool;
                               
                                  await viewModel.init();
                                
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
