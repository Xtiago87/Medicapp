import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = 'Tiago Halliday';
    final String email = 'tiago@email.com';

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Foto de perfil
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://i.imgur.com/BoN9kdC.png', // placeholder temporário
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Nome do usuário
            Text(userName, style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 32),

            // Botão para alterar dados
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Alterar dados da conta'),
              onTap: () {
                // TODO: navegar para a tela de edição de dados
              },
            ),
            const Divider(),
            // Botão para alterar dados
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Deletar conta'),
              onTap: () {
                // TODO: navegar para a tela de edição de dados
              },
            ),

            const Divider(),

            // Botão de logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair da conta'),
              onTap: () {
                // TODO: chamar logout da ViewModel e redirecionar para login
              },
            ),
          ],
        ),
      ),
    );
  }
}
