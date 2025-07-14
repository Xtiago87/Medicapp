import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  final tabs = [
    '/main/home',
    '/main/historico',
    '/main/med_form',
    '/main/perfil',
  ];

  void onTabTapped(int index) {
    setState(() => currentIndex = index);
    Modular.to.navigate(tabs[index]);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.to.navigate(tabs[currentIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                setState(() => currentIndex = 2);
                Modular.to.navigate(tabs[2]);
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
