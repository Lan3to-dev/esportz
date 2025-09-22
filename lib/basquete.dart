import 'package:flutter/material.dart';
import 'treinos_basquete.dart';

class BasquetePage extends StatefulWidget {
  const BasquetePage({super.key});

  @override
  State<BasquetePage> createState() => _BasquetePageState();
}

class _BasquetePageState extends State<BasquetePage> {
  int _selectedIndex = 0;

  // Conteúdos para cada aba da BottomNavigation
  static final List<Widget> _bottomNavPages = <Widget>[
    ApresentacaoBasquete(),
    ConteudoBasquete(),   // História, fundamentos, curiosidades
    RegrasBasquete(),    // Exercícios práticos
    FundamentosBasquete(),   // Posições e estratégias
  ];


  final Widget _posicoesPage = PosicoesBasquete();

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
        title: const Text("Basquete"),
        backgroundColor: Colors.orange,

      ),

      // Drawer com navegação extra
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

                Navigator.push(context, MaterialPageRoute(builder: (context) => const TreinosBasquete()));
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

      // Conteúdo que muda com base na BottomNavigation
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


      // BottomNavigationBar
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // cor da borda
              width: 1,           // espessura da borda
            ),
          ),
        ),
        child: BottomNavigationBar(
           // cor de fundo do BottomNavigationBar
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
      ),

    );
  }
}

class ApresentacaoBasquete extends StatelessWidget {
  const ApresentacaoBasquete({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // 📷 Imagem ilustrativa (substitua pelo seu asset)
          Image.asset(
            "assets/images/apresentacaoBasquete.jpg", // coloque sua imagem em assets
            height: 180,
          ),

          const SizedBox(height: 30),

          // 🏀 Título
          const Text(
            "Bem-vindo à seção de Basquete!",
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
            "Explore a história, fundamentos, treinos e posições do basquete.",
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          // 📖 Texto descritivo adicional
          const Text(
            "O basquetebol ou basquete é um esporte coletivo jogado por duas equipes, "
                "que têm o objetivo de fazer pontos ao acertar a bola na cesta do adversário, "
                "o alvo fixo na quadra.\n\n"
                "A prática é caracterizada por ser dinâmica e envolver diferentes capacidades físicas, "
                "como a agilidade e a coordenação motora. "
                "O esporte é um dos mais populares do mundo, praticado atualmente por mais de "
                "300 milhões de pessoas em mais de 170 países filiados à Federação Internacional "
                "de Basquetebol (FIBA).",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}



// Página de Conteúdo com Scrollbar
class ConteudoBasquete extends StatefulWidget {
  const ConteudoBasquete({super.key});

  @override
  State<ConteudoBasquete> createState() => _ConteudoBasqueteState();
}

class _ConteudoBasqueteState extends State<ConteudoBasquete> {
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
              "História do Basquete",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O surgimento do basquete ocorreu no ano de 1891, nos Estados Unidos. "
                  "O idealizador do esporte foi o canadense James Naismith, professor de Educação Física "
                  "na Associação Cristã de Moços de Springfield, em Massachusetts.\n\n"
                  "Ele buscava um jogo que pudesse ser praticado durante o inverno, em local fechado, "
                  "com exercícios completos e que evitasse a violência do futebol americano.\n\n"
                  "Naismith criou uma prática com um alvo fixo (cestas de pêssego), bola arremessada ao alvo "
                  "e disputada por duas equipes. As cestas foram colocadas a 3,05m de altura, medida oficial até hoje.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 16),

            // 📷 Imagem exemplo (adicione seu asset)
            Image.asset(
              "assets/images/naismith.jpg",
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // 🏀 Primeira Partida
            const Text(
              "Primeira Partida",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "A primeira partida aconteceu em 21 de dezembro de 1891, com dois tempos de 15 minutos "
                  "e nove jogadores em cada equipe. Naismith também estabeleceu 13 regras originais "
                  "que permaneceram inalteradas por 50 anos.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 20),

            // 👩 Basquete feminino
            const Text(
              "Basquete Feminino",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Senda Berenson Abbott foi a responsável por difundir o basquete entre as mulheres em 1892, "
                  "no Smith College (EUA). Ela adaptou as regras em conversas com Naismith e introduziu o esporte "
                  "no cenário feminino.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 20),

            // 🏅 Olimpíadas e FIBA
            const Text(
              "Olimpíadas e FIBA",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O basquete apareceu nos Jogos Olímpicos de 1904 como demonstração, sendo incluído oficialmente "
                  "em 1936 (Berlim). A FIBA (Federação Internacional de Basquetebol) foi fundada em 1932, "
                  "com sede em Mies, Suíça.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 20),

            // 🌍 Cultura e Personalidades
            const Text(
              "Cultura e Personalidades",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O basquete se tornou parte da luta por igualdade nos EUA, sendo palco da ascensão de grandes "
                  "jogadores negros como Kareem Abdul-Jabbar, Bill Russell, Wilt Chamberlain, Magic Johnson, "
                  "Kobe Bryant, LeBron James e Michael Jordan, considerado o maior da história.\n\n"
                  "O esporte também se conectou à cultura popular, especialmente ao hip-hop e ao R&B, "
                  "inspirando filmes como *Space Jam*, *Homens Brancos Não Sabem Enterrar* e *Coach Carter*.",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 30),

            // 📌 Fundamentos
            const Text(
              "Fundamentos do Basquete",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "• Drible\n"
                  "• Passe\n"
                  "• Arremesso\n"
                  "• Defesa\n"
                  "• Rebote",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}





// Exemplo para Posições
class PosicoesBasquete extends StatelessWidget {
  const PosicoesBasquete({super.key});

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
              "assets/images/posicoesBasquete.png", // substitua pelo seu asset
              height: 180,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),

          // 🏀 Título
          const Text(
            "Posições no Basquete",
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
            "Os jogadores da equipe possuem posições e funções definidas para a partida. Confira as características de cada posição:",
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Armador
          const Text(
            "Armador",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "É considerado, de maneira geral, aquele que melhor dribla e faz o passe de bola do time. Às vezes, é chamado de ala esquerda.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Lançador
          const Text(
            "Lançador",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Também conhecido como escolta, é o melhor que arremessa no time. Sua função é defender o armador e tentar ganhar espaço na quadra para arremessar a bola sem ser bloqueado.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Ala/pivô
          const Text(
            "Ala/Pivô",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Próximo da cesta, este jogador se movimenta com o intuito de desmarcar e receber a bola nas situações de arremesso intermediário. Também possui habilidade com rebotes.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Ala/Lateral
          const Text(
            "Ala/Lateral",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "É o mais versátil do time, com habilidades como equilíbrio. Geralmente, é melhor lançador do que o pivô e tende a ser mais baixo que ele.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Pivô
          const Text(
            "Pivô",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Também conhecido como central, geralmente é o mais alto da equipe. Sua função é permitir proximidade com a cesta, possibilitando um arremesso fácil. Na defesa, busca bloquear arremessos e pegar rebotes.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}


class RegrasBasquete extends StatelessWidget {
  const RegrasBasquete({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Regras do Basquete",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "O basquete é jogado por dois times com cinco jogadores de cada equipe em quadra. "
                "Os objetivos são:\n\n"
                "• Ataque: arremessar e acertar a bola na cesta do time adversário.\n"
                "• Defesa: bloquear a equipe oponente para que não realize o ataque.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          const Text(
            "Dimensões da Quadra",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "A quadra mede 28 metros de comprimento por 15 metros de largura. "
                "As cestas ficam a 3,05 metros de altura e localizadas nas extremidades.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),
          Image.asset(
            "assets/images/regrasBasquete.jpg",
            height: 200,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),

          const Text(
            "Pontuação e Faltas",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pontuação:\n"
                "• 1 ponto: lance livre\n"
                "• 2 pontos: cesta normal\n"
                "• 3 pontos: além da linha de 6,2 metros\n\n"
                "Faltas:\n"
                "• Mais de dois passos sem quicar a bola\n"
                "• Segurar a bola mais de cinco segundos\n"
                "• Mais de três segundos no garrafão\n"
                "• Tocar no braço/mão do adversário",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class FundamentosBasquete extends StatelessWidget {
  const FundamentosBasquete({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // 📷 Imagem ilustrativa

          Center(
            child: Image.asset(
              "assets/images/fundamentosBasquete.jpg",
              height: 180,
              fit: BoxFit.cover,
            ),
          ),


          const SizedBox(height: 30),

          // 🏀 Título
          const Text(
            "Fundamentos do Basquete",
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
            "O basquete é composto por cinco fundamentos essenciais em sua partida:",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),

          const SizedBox(height: 20),

          // 📌 Passe
          const Text(
            "Passe",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Lançamento da bola para outro jogador da mesma equipe. O passe pode ser realizado das seguintes formas:\n"
                "• De peito: empurrando a bola com as duas mãos (mais comum, rápido e linear)\n"
                "• Com uma das mãos\n"
                "• Passe quicado\n"
                "• Por cima do ombro\n"
                "• Por cima da cabeça\n\n"
                "Para avançar na quadra e ganhar espaço, é fundamental que os jogadores explorem a troca de passes.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Drible
          const Text(
            "Drible",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Jogada em que a bola é quicada no chão com o objetivo de ultrapassar o adversário e chegar mais próximo à cesta ou buscar uma melhor posição tática. É necessário boa coordenação motora dos membros superiores.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Arremesso
          const Text(
            "Arremesso",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Fundamento primordial, em que o atleta arremessa a bola em direção à cesta para pontuar. Tipos de arremesso:\n"
                "• Bandeja: arremesso na tabela para a cesta\n"
                "• Gancho: próximo à tabela, usando uma das mãos para lançar a bola",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Rebote
          const Text(
            "Rebote",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Quando o jogador pega a bola após outro jogador errar o arremesso. Pode ser de ataque ou defesa. Estar preparado para rebotes é fundamental para contra-ataques.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 20),

          // 📌 Lance livre
          const Text(
            "Lance Livre",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          const Text(
            "Arremesso sem marcação que acontece após uma falta ou quando a equipe atinge o limite de cinco faltas por bloco de tempo do jogo.",
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}


