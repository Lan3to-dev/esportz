import 'package:flutter/material.dart';

class TreinoJogosPage extends StatelessWidget {
  const TreinoJogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Corrida do drible",
            "descricao":
            "Corrida simples de um lado ao outro da quadra, quicando a bola; bom para coordenação e resistência leve.",
          },
          {
            "titulo": "Queimado adaptado",
            "descricao":
            "Versão do queimado usando fundamentos de passe e drible, com regras adaptadas para segurança.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Rei da quadra (King of the Court)",
            "descricao":
            "Jogos curtos 3x3/4x4 onde o time vencedor permanece; desenvolve competição e rotação de jogadores.",
          },
          {
            "titulo": "Racha de arremessos",
            "descricao":
            "Competição por acertos consecutivos a partir de pontos pré-definidos, trabalhando concentração e técnica.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Jogo de situações",
            "descricao":
            "Simulações táticas (últimos 10s, desvantagem de pontos, falta estratégica) para tomada de decisão.",
          },
          {
            "titulo": "Desafios em equipe",
            "descricao":
            "Metas coletivas (nº de passes, rebotes, pontos) com tempo limitado — estimula cooperação e foco.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogos e Dinâmicas"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: treinos.length,
        itemBuilder: (context, index) {
          final bloco = treinos[index];
          return Card(
            color: Colors.grey[850],
            margin: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              iconColor: Colors.orange,
              collapsedIconColor: Colors.orange,
              title: Text(
                bloco["nivel"] as String,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              children: (bloco["exercicios"] as List).map((ex) {
                return ListTile(
                  title: Text(
                    ex["titulo"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      ex["descricao"],
                      style: const TextStyle(color: Colors.white70, height: 1.3),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}