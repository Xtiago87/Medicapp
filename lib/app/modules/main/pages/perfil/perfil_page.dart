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

  @override
  void initState() {
    super.initState();
    viewModel = Modular.get<PerfilViewmodel>();
    viewModel.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final String userName = viewModel.user.value?.name ?? 'Nome do usuário';
    final String email = viewModel.user.value?.email ?? 'email@exemplo.com';

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

            Text(userName, style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 32),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Alterar dados da conta'),
              onTap: () {

              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Deletar conta'),
              onTap: () async {
                final result = await viewModel.deletarUser();
                if (result) {
                 Modular.to.navigate('/');
                }
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair da conta'),
              onTap: () async {
                final result = await viewModel.logoutUser();
                if (result) {
                  Modular.to.navigate('/');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
