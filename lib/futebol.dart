import 'package:flutter/material.dart';

class FutebolPage extends StatefulWidget {
  const FutebolPage({super.key});

  @override
  State<FutebolPage> createState() => _FutebolPageState();
}

class _FutebolPageState extends State<FutebolPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const ApresentacaoFutebol(),
    const ConteudoFutebol(),
    const TreinosFutebol(),
    const PosicoesFutebol(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futebol"),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Menu", style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back),
              title: const Text("Voltar à seleção"),
              onTap: () {
                Navigator.pop(context); // fecha o Drawer
                Navigator.pop(context); // volta para a tela anterior
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("História"),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text("Treinos"),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Posições"),
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.black, padding: const EdgeInsets.all(16)),
          Container(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "História"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Treinos"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Posições"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ApresentacaoFutebol extends StatelessWidget {
  const ApresentacaoFutebol({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo ao Futebol App!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            Text("Explore a história, fundamentos, treinos e posições do futebol.",
                style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class ConteudoFutebol extends StatelessWidget {
  const ConteudoFutebol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("História do Futebol", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 10),
            Text("O futebol moderno surgiu na Inglaterra no século XIX, mas formas primitivas já existiam há séculos...",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 20),
            Text("Fundamentos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 10),
            Text("• Passe\n• Drible\n• Finalização\n• Marcação\n• Posicionamento",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class TreinosFutebol extends StatelessWidget {
  const TreinosFutebol({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        "Treinos sugeridos:\n\n• Toque de bola em triângulo\n• Finalização com chute a gol\n• Treino de marcação 1x1\n• Corrida com mudança de direção",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class PosicoesFutebol extends StatelessWidget {
  const PosicoesFutebol({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        "Posições no Futebol:\n\n• Goleiro: protege o gol\n• Zagueiro: defesa central\n• Lateral: apoia ataque e defesa\n• Meio-campista: organiza jogadas\n• Atacante: finaliza e marca gols",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}