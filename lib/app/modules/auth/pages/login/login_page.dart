import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/auth/viewmodels/login/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<LoginViewModel>();
    viewModel.error.addListener(() {
      final message = viewModel.error.value;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    });
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await viewModel.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      debugPrint('result $result');
      if(result){
        Modular.to.navigate('/main/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(title: const Text('Entrar')),
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value == null || !value.contains('@')
                          ? 'E-mail inválido'
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Modular.to.pushNamed('/esqueceu_senha'),
                        child: const Text('Esqueceu senha?'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: viewModel.isLoading.value ? null : _submit,
                      child: const Text('Entrar'),
                    ),
                    TextButton(
                      onPressed: () => Modular.to.pushNamed('/cadastro'),
                      child: const Text('Criar conta'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.isLoading.value)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
