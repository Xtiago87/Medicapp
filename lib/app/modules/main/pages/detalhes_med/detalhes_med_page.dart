import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/viewmodels/detalhes_med/detalhes_med_viewmodel.dart';
import 'package:medicapp/app/modules/main/viewmodels/med_form/med_form_viewmodel.dart';

class DetalhesMedPage extends StatefulWidget {
  final int medId;

  const DetalhesMedPage({super.key, required this.medId});

  @override
  State<DetalhesMedPage> createState() => _DetalhesMedPageState();
}

class _DetalhesMedPageState extends State<DetalhesMedPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final obsController = TextEditingController();

  bool tomando = true;
  bool edicaoHabilitada = false;
  DateTime? startDate;
  DateTime? endDate;

  late DetalhesMedViewmodel viewModel;

  Map<String, int> diasDaSemanaMap = {
    'Dom': 7,
    'Seg': 1,
    'Ter': 2,
    'Qua': 3,
    'Qui': 4,
    'Sex': 5,
    'Sáb': 6,
  };

  Map<String, bool> diasSemanaSelecionados = {
    'Dom': false,
    'Seg': false,
    'Ter': false,
    'Qua': false,
    'Qui': false,
    'Sex': false,
    'Sáb': false,
  };

  Map<int, String> diaNumeroParaNome = {
    7: 'Dom',
    1: 'Seg',
    2: 'Ter',
    3: 'Qua',
    4: 'Qui',
    5: 'Sex',
    6: 'Sáb',
  };

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<DetalhesMedViewmodel>();
    loadMed();
  }

  Future<void> loadMed() async {
    try {
      final med = await viewModel.getMed(widget.medId);
      if (med == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Erro ao carregar medicação! Tente nocvamente mais tarde",
            ),
          ),
        );
        return;
      }
      setState(() {
        nomeController.text = med.nome;
        obsController.text = med.observacao;
        tomando = true;
        startDate = med.startDate;
        endDate = med.endDate;
        for (var dia in med.diasSemana) {
          final nomeDia = diaNumeroParaNome[dia];
          if (nomeDia != null) {
            diasSemanaSelecionados[nomeDia] = true;
          }
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao carregar medicação! Tente nocvamente mais tarde",
          ),
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes de Medicamento'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.deleteMed(widget.medId);
            },
            icon: Icon(Icons.delete),
          ),
          if (!edicaoHabilitada)
            IconButton(
              onPressed: () {
                setState(() {
                  edicaoHabilitada = true;
                });
              },
              icon: Icon(Icons.edit),
            ),
          if (edicaoHabilitada)
            IconButton(
              onPressed: () {
                setState(() {
                  edicaoHabilitada = false;
                });
              },
              icon: Icon(Icons.save),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Medicamento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Digite o nome' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: obsController,
                decoration: const InputDecoration(
                  labelText: 'Observações',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              const Text('Status:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: [
                  ChoiceChip(
                    label: const Text('Tomando'),
                    selected: tomando,
                    onSelected: (_) => setState(() => tomando = true),
                  ),
                  ChoiceChip(
                    label: const Text('Pausado'),
                    selected: !tomando,
                    onSelected: (_) => setState(() => tomando = false),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text('Dias da semana:'),
              Wrap(
                spacing: 8,
                children: diasSemanaSelecionados.keys.map((dia) {
                  return FilterChip(
                    label: Text(dia),
                    selected: diasSemanaSelecionados[dia]!,
                    onSelected: (selected) {
                      setState(() {
                        diasSemanaSelecionados[dia] = selected;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              ListTile(
                title: const Text('Data de Início'),
                subtitle: Text(
                  startDate != null
                      ? '${startDate!.day}/${startDate!.month}/${startDate!.year}'
                      : 'Selecione uma data',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),

              ListTile(
                title: const Text('Data de Término'),
                subtitle: Text(
                  endDate != null
                      ? '${endDate!.day}/${endDate!.month}/${endDate!.year}'
                      : 'Selecione uma data',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final nome = nomeController.text.trim();
                    final observacao = obsController.text.trim();
                    final diasSemana = diasSemanaSelecionados.entries
                        .where((e) => e.value)
                        .map((e) => diasDaSemanaMap[e.key]!)
                        .toList();

                    final result = await viewModel.editarMedicacao(
                      nome: nome,
                      observacao: observacao,
                      tomando: tomando,
                      diasSemana: diasSemana,
                      startDate: startDate!,
                      endDate: endDate!,
                      id: widget.medId
                    );

                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Medicamento salvo com sucesso!'),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            viewModel.error.value ?? 'Erro ao salvar',
                          ),
                        ),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar Medicamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
