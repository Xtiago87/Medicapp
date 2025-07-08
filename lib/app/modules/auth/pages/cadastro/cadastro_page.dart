import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/auth/viewmodels/cadastro/cadastro_viewmodel.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late CadastroViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<CadastroViewmodel>();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final nome = nameController.text.trim();
      final email = emailController.text.trim();
      final senha = passwordController.text.trim();

      final sucesso = await viewModel.cadastrar(nome, email, senha);

      if (sucesso) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Conta criada com sucesso!'),
          ),
        );
        Modular.to.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.error.value ?? 'Erro ao cadastrar')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe seu nome' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || !value.contains('@')
                    ? 'E-mail inválido'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmEmailController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar e-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value != emailController.text
                    ? 'Os e-mails devem ser iguais'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) => value == null || value.length < 6
                    ? 'Senha muito curta'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) => value != passwordController.text
                    ? 'As senhas devem ser iguais'
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
