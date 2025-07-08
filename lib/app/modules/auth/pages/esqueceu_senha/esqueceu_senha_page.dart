import 'package:flutter/material.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({super.key});

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Chamar ForgotPasswordViewModel aqui
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar senha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || !value.contains('@') ? 'E-mail inválido' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Enviar e-mail de recuperação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
