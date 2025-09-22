import 'package:flutter/material.dart';
import 'treinos_volei.dart';


class VoleiPage extends StatefulWidget {
  const VoleiPage({super.key});

  @override
  State<VoleiPage> createState() => _VoleiPageState();
}

class _VoleiPageState extends State<VoleiPage> {
  int _selectedIndex = 0;

  static final List<Widget> _bottomNavPages = <Widget>[
    const ApresentacaoVolei(),
    const ConteudoVolei(),
    const RegrasVolei(),
    const FundamentosVolei(),
  ];

  final Widget _posicoesPage = PosicoesVolei();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget currentPage;

    if (_selectedIndex == -1) {
      currentPage = _posicoesPage;
    } else {
      currentPage = _bottomNavPages[_selectedIndex];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vôlei"),
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
              leading: const Icon(Icons.fitness_center),
              title: const Text("Treinos"),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const TreinosVolei()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Posições"),
              onTap: () {
                setState(() {
                  _selectedIndex = -1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(16),
          ),
          Container(
            child: currentPage,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "História"),
          BottomNavigationBarItem(icon: Icon(Icons.rule), label: "Regras"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Fundamentos"),
        ],
        currentIndex: (_selectedIndex < 0 ? 0 : _selectedIndex),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ApresentacaoVolei extends StatelessWidget {
  const ApresentacaoVolei({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),


          Image.asset(
            "assets/images/apresentacaoVolei.jpg", // coloque sua imagem em assets
            height: 180,
          ),

          const SizedBox(height: 30),

          // 🏐 Título
          const Text(
            "Bem-vindo à seção de Vôlei!",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ✨ Mensagem curta inicial
          const Text(
            "Explore a história, fundamentos, treinos e posições do vôlei.",
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          // 📖 Texto descritivo adicional
          const Text(
            "O voleibol ou vôlei é um esporte coletivo praticado em uma quadra dividida por uma rede. "
                "Duas equipes disputam a partida com o objetivo de tocar a bola no campo adversário, "
                "a qual deve ser arremessada por cima da rede.\n\n"
                "O esporte é um dos mais populares no Brasil e no mundo em termos de praticantes e audiência. "
                "Tanto a Seleção Brasileira Feminina de Vôlei quanto a Masculina conquistaram diversos títulos, "
                "incluindo medalhas nas Olimpíadas e no campeonato mundial.\n\n"
                "Além da modalidade tradicional na quadra, o vôlei conta com outras versões, "
                "tais como o vôlei de praia, o vôlei sentado (praticado por pessoas com deficiência) e o futevôlei.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class ConteudoVolei extends StatefulWidget {
  const ConteudoVolei({super.key});

  @override
  State<ConteudoVolei> createState() => _ConteudoVoleiState();
}

class _ConteudoVoleiState extends State<ConteudoVolei> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      interactive: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 📖 História
            const Text(
              "História do Vôlei",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O vôlei surgiu em 1895 nos Estados Unidos, criado por William George Morgan, "
                  "diretor de Educação Física da Associação Cristã de Moços (ACM) da cidade de Holyoke, "
                  "em Massachusetts.\n\n"
                  "O objetivo era desenvolver um esporte que pudesse ser praticado em local fechado durante o inverno, "
                  "com menor desgaste físico e menos contato do que o recém-criado basquete (1891). "
                  "Inicialmente, o esporte foi chamado de *mintonette*.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 16),

         Center(
           child: Image.asset(
              "assets/images/morganVolei.jpg",
              height: 200,
              fit: BoxFit.cover,
            ),
         ),
            const SizedBox(height: 20),

            // 📌 Primeiras Regras
            const Text(
              "Primeiras Regras",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O mintonette tinha regras diferentes do vôlei atual, mas já possuía a quadra dividida por uma rede "
                  "e o objetivo de arremessar a bola por cima dela. "
                  "Em 1915, o vôlei passou a ser incluído em aulas de Educação Física nas escolas dos EUA. "
                  "No ano seguinte, a ACM ajudou a divulgar suas regras em artigos entre estudantes universitários.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 20),

            // 🌍 Disseminação Mundial
            const Text(
              "Disseminação Mundial",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "A prática do vôlei se espalhou rapidamente pelas forças armadas americanas. "
                  "A partir de 1900 chegou ao Canadá, em 1905 a Cuba e em 1908 ao Japão e às Filipinas. "
                  "Na década de 1930, o esporte já estava presente em outros continentes e começava a ganhar popularidade "
                  "em competições esportivas.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),


            const SizedBox(height: 20),

            // 🏆 FIBV e Olimpíadas
            const Text(
              "FIBV e Olimpíadas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "A Federação Internacional de Voleibol (FIBV) foi fundada em 1947, em Paris. "
                  "Dois anos depois aconteceu o primeiro Campeonato Mundial masculino (1949) "
                  "e em 1952 ocorreu a primeira edição feminina.\n\n"
                  "Em 1964, nas Olimpíadas de Tóquio, o vôlei passou a integrar oficialmente o programa olímpico, "
                  "marcando a consolidação da modalidade no cenário esportivo mundial.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 16),

            Image.asset(
              "assets/images/partidaVolei.jpg",
              height: 200,
              fit: BoxFit.cover,
            ),



            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


class PosicoesVolei extends StatelessWidget {
  const PosicoesVolei({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // 📷 Imagem centralizada
          Center(
            child: Image.asset(
              "assets/images/posicoesVolei.png",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),

          // 🏐 Título
          const Text(
            "Posições no Vôlei",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ✨ Mensagem introdutória
          const Text(
            "As posições no vôlei são divididas entre a linha de frente e a linha de trás. "
                "Cada jogador deve respeitar o posicionamento, que é definido pelo contato dos pés no chão. "
                "Confira a distribuição:",
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.4),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 20),

          // 📌 Linha de frente
          const Text(
            "Linha de Frente",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Posição 4: frente-esquerda\n"
                "• Posição 3: frente-central\n"
                "• Posição 2: frente-direita",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Linha de trás
          const Text(
            "Linha de Trás",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Posição 5: trás-esquerda\n"
                "• Posição 6: trás-central\n"
                "• Posição 1: trás-direita",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Rotação
          const Text(
            "Rotação",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "A rotação define a ordem de saque e a movimentação dos jogadores em quadra. "
                "Sempre que a equipe ganha o direito de sacar, todos avançam uma posição no sentido horário.\n\n"
                "Exemplo: o jogador da posição 2 passa a ocupar a posição 1 para sacar, "
                "enquanto o da posição 1 vai para a posição 6.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}




class RegrasVolei extends StatelessWidget {
  const RegrasVolei({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Regras do Vôlei",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "As regras do vôlei sofrem mudanças e adaptações desde a criação do esporte, em 1895. "
                "Confira a seguir informações sobre área da quadra, equipamentos, quantidade de jogadores, "
                "posições, pontuação, toques, faltas e a evolução das regras.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Área de jogo =================
          const Text(
            "Área de jogo e equipamentos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "A quadra de vôlei mede 18 metros de comprimento por 9 metros de largura. "
                "Nas competições oficiais, a zona livre deve medir 5 metros nas laterais e 6,5 metros ao fundo. "
                "A altura livre mínima é de 12,5 metros.\n\n"
                "A rede possui altura de 2,43 m para homens e 2,24 m para mulheres. "
                "A bola deve ser de couro ou material sintético flexível.\n\n"
                "Equipamentos dos jogadores: camiseta, shorts, meias (diferente para o líbero), "
                "e calçado esportivo. O capitão usa uma tarja abaixo do número.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 15),
          Image.asset(
            "assets/images/regrasVolei.jpg", // imagem da quadra
            height: 200,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),

          // ================= Quantidade de jogadores =================
          const Text(
            "Quantidade de jogadores",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "Cada equipe tem 12 jogadores, sendo 6 em quadra. "
                "Além deles, há comissão técnica e corpo médico. "
                "Ao longo de um set, podem ser feitas até 6 substituições.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Posições =================
          const Text(
            "Posições e rotação",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "Jogadores se distribuem em linha de frente (posições 4, 3 e 2) e linha de trás (posições 5, 6 e 1). "
                "A posição é definida pelo contato dos pés no chão.\n\n"
                "A rotação ocorre sempre que a equipe conquista o direito ao saque: "
                "os jogadores avançam uma posição no sentido horário.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Pontuação =================
          const Text(
            "Pontuação",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "Um set é vencido ao atingir 25 pontos, com diferença mínima de 2 pontos. "
                "A partida é vencida pela equipe que conquistar 3 sets.\n\n"
                "Se houver empate em 2 sets, o 5º set vai até 15 pontos, "
                "também com diferença mínima de 2 pontos.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Toques =================
          const Text(
            "Toques",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "Cada equipe pode realizar até 3 toques, além do bloqueio, "
                "antes de mandar a bola ao campo adversário. "
                "A bola pode tocar qualquer parte do corpo, desde que de forma contínua.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Faltas =================
          const Text(
            "Faltas",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "• Dois toques: quando o jogador toca a bola duas vezes seguidas.\n"
                "• Posição incorreta: jogador fora da posição definida.\n"
                "• Rotação incorreta: saque fora da ordem.\n"
                "• Quatro toques: quando a equipe toca na bola quatro vezes.\n"
                "• Toque apoiado: usar outro jogador ou objeto como apoio.\n"
                "• Condução: reter ou lançar a bola.\n"
                "• Rede: tocar na rede.\n\n"
                "O árbitro é responsável por marcar as faltas.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // ================= Evolução =================
          const Text(
            "Evolução das regras",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "As mudanças nas regras acompanham a evolução do esporte e sua popularização. "
                "Um marco importante foi a criação do líbero em 1998, posição dedicada à defesa e recepção.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}



class FundamentosVolei extends StatelessWidget {
  const FundamentosVolei({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),




          // 🏐 Título
          const Text(
            "Fundamentos do Vôlei",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ✨ Mensagem introdutória
          const Text(
            "O vôlei é composto por fundamentos técnicos que estruturam o jogo e "
                "são essenciais para o desempenho das equipes:",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),

          const SizedBox(height: 20),

          // 📌 Saque
          const Text(
            "Saque",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "O saque é a ação que coloca a bola em jogo. Pode ser realizado de diversas formas:\n"
                "• Por baixo\n"
                "• Por cima\n"
                "• Saque viagem\n\n"
                "Existem saques com ou sem salto, variando em potência e estratégia.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Toque ou levantamento
          const Text(
            "Toque ou Levantamento",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Fundamento utilizado em várias situações, como recepção, ataque e principalmente "
                "no levantamento, que prepara a bola para o ataque.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Manchete
          const Text(
            "Manchete",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Utilizada principalmente na recepção de saque e na defesa. "
                "Requer postura corporal adequada para controlar a direção da bola.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 15),
          Center(
            child: Image.asset(
              "assets/images/mancheteVolei.jpg",
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          // 📌 Ataque
          const Text(
            "Ataque",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Envolve coordenação de passadas, movimentação de braços e salto para "
                "impulsionar a bola em direção à quadra adversária. "
                "É um dos principais meios de pontuação no jogo.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 15),


          // 📌 Defesa
          const Text(
            "Defesa",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Conjunto de ações técnicas que mantêm a bola em jogo e "
                "abrem espaço para o contra-ataque. "
                "Inclui principalmente a recepção e a reação rápida aos ataques adversários.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),


          const SizedBox(height: 20),

          // 📌 Bloqueio
          const Text(
            "Bloqueio",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Parte essencial do sistema defensivo. Geralmente realizado por dois ou mais jogadores próximos à rede, "
                "com o objetivo de interceptar o ataque adversário.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 15),
          Center(
            child: Image.asset(
              "assets/images/bloqueioVolei.png",
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

