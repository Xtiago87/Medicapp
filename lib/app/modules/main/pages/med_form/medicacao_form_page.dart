import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/viewmodels/med_form/med_form_viewmodel.dart';

class MedicacaoFormPage extends StatefulWidget {
  const MedicacaoFormPage({super.key});

  @override
  State<MedicacaoFormPage> createState() => _MedicacaoFormPageState();
}

class _MedicacaoFormPageState extends State<MedicacaoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final obsController = TextEditingController();

  bool tomando = true;
  DateTime? startDate;
  DateTime? endDate;

  late MedFormViewmodel viewModel;

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

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<MedFormViewmodel>();
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

  void salvarRemedio() async {
    if (_formKey.currentState!.validate()) {
      final nome = nomeController.text.trim();
      final observacao = obsController.text.trim();
      final diasSemana = diasSemanaSelecionados.entries
          .where((e) => e.value)
          .map((e) => diasDaSemanaMap[e.key]!)
          .toList();

      if (diasSemana.isEmpty && tomando) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selecione ao menos um dia da semana')),
        );
        return;
      }

      if (startDate == null || endDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Datas de inicio e fim devem ser selecionadas'),
          ),
        );
        return;
      }

      final result = await viewModel.salvarMedicacao(
        nome: nome,
        observacao: observacao,
        tomando: tomando,
        diasSemana: diasSemana,
        startDate: startDate!,
        endDate: endDate!,
      );

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Medicamento salvo com sucesso!')),
        );
        clearFields();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.error.value ?? 'Erro ao salvar')),
        );
      }
    }
  }

  void clearFields() {
    setState(() {
      tomando = true;
      startDate = null;
      endDate = null;
      nomeController.clear();
      obsController.clear();
      diasSemanaSelecionados = {
        'Dom': false,
        'Seg': false,
        'Ter': false,
        'Qua': false,
        'Qui': false,
        'Sex': false,
        'Sáb': false,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Medicamento')),
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
                    label: const Text('Finalizado'),
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
                onPressed: salvarRemedio,
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
