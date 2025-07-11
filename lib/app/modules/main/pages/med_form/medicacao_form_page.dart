import 'package:flutter/material.dart';

class MedicacaoFormPage extends StatefulWidget {
  const MedicacaoFormPage({super.key});

  @override
  State<MedicacaoFormPage> createState() => _MedicacaoFormPageState();
}

class _MedicacaoFormPageState extends State<MedicacaoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController obsController = TextEditingController();
  bool tomando = true;

  // Dias da semana selecionados
  Map<String, bool> diasSemana = {
    'Dom': false,
    'Seg': false,
    'Ter': false,
    'Qua': false,
    'Qui': false,
    'Sex': false,
    'Sáb': false,
  };

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
              // Nome
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Medicamento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Digite o nome do medicamento'
                    : null,
              ),
              const SizedBox(height: 16),

              // Observação
              TextFormField(
                controller: obsController,
                decoration: const InputDecoration(
                  labelText: 'Observações',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Status
              // Status com ChoiceChips
              const Text('Status:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: [
                  ChoiceChip(
                    label: const Text('Tomando'),
                    selected: tomando,
                    onSelected: (selected) {
                      setState(() => tomando = true);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Finalizado'),
                    selected: !tomando,
                    onSelected: (selected) {
                      setState(() => tomando = false);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Dias da semana
              const Text('Dias da semana:'),
              Wrap(
                spacing: 8,
                children: diasSemana.entries.map((entry) {
                  return FilterChip(
                    label: Text(entry.key),
                    selected: entry.value,
                    onSelected: (selected) {
                      setState(() {
                        diasSemana[entry.key] = selected;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              // Botão Salvar
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nome = nomeController.text.trim();
                    final obs = obsController.text.trim();
                    final diasSelecionados = diasSemana.entries
                        .where((e) => e.value)
                        .map((e) => e.key)
                        .toList();

                    // TODO: conectar com a viewmodel
                    print(
                      'Salvar: $nome - $obs - $tomando - $diasSelecionados',
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Medicamento salvo com sucesso!'),
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
