import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/viewmodels/perfil/perfil_viewmodel.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late final PerfilViewmodel viewModel;

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<PerfilViewmodel>();
    getUser();
  }

  getUser() async {
    await viewModel.getUser();
    if (viewModel.user.value != null) {
      nomeController.text = viewModel.user.value!.name;
      emailController.text = viewModel.user.value!.email;
      senhaController.text = viewModel.user.value!.senha;
    }
  }

  Future<void> showEditarDialog(BuildContext context) async {
    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar dados'),
        content: Form(
          key: formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Informe o email';
                    final emailRegex = RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) return 'Email inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: senhaController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) => value == null || value.length < 6
                      ? 'Mínimo 6 caracteres'
                      : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: const Text('Confirmar'),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final nome = nomeController.text.trim();
                final email = emailController.text.trim();
                final senha = senhaController.text.trim();

                await viewModel.editarConta(nome, email, senha);
                await viewModel.getUser();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<bool?> modalConfirmacao(
    BuildContext context,
    String titulo,
    String mensagem,
    Function()? onConfirm,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Não'),
          ),
          ElevatedButton(onPressed: onConfirm, child: const Text('Sim')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://i.imgur.com/BoN9kdC.png',
                ),
              ),
            ),

            const SizedBox(height: 16),

            ValueListenableBuilder(
              valueListenable: viewModel.user,
              builder: (context, value, child) {
                return Text(
                  value?.name ?? 'Nome do usuário',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: viewModel.user,
              builder: (context, value, child) {
                return Text(
                  value?.email ?? 'Nome do usuário',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
            const SizedBox(height: 32),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Alterar dados da conta'),
              onTap: () {
                showEditarDialog(context);
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Deletar conta'),
              onTap: () async {
                modalConfirmacao(
                  context,
                  "Excluir conta",
                  "Tem certeza que quer excluir sua conta?",
                  () async {
                    final result = await viewModel.deletarUser();
                    if (result) {
                      Modular.to.navigate('/');
                    }
                  },
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair da conta'),
              onTap: () async {
                modalConfirmacao(
                  context,
                  "Logout",
                  "Tem certeza que quer realizar o logout?",
                  () async {
                    final result = await viewModel.logoutUser();
                    if (result) {
                      Modular.to.navigate('/');
                    }
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
