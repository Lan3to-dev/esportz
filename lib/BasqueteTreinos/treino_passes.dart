import 'package:flutter/material.dart';

class TreinoPassesPage extends StatelessWidget {
  const TreinoPassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Passe de peito em dupla",
            "descricao":
            "Dois jogadores frente a frente trocando passes de peito, focando na precisão e postura.",
          },
          {
            "titulo": "Passe picado",
            "descricao":
            "O jogador deve realizar passes que quicam no chão antes de chegar ao colega.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Passe em movimento",
            "descricao":
            "Dois jogadores correm lado a lado, trocando passes enquanto avançam pela quadra.",
          },
          {
            "titulo": "Passe contra a parede",
            "descricao":
            "Individual: o jogador realiza passes de diferentes tipos contra a parede, treinando força e direção.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Passe sob pressão",
            "descricao":
            "Treino em que defensores simulam bloqueios e o jogador deve encontrar ângulos de passe.",
          },
          {
            "titulo": "Passe rápido em círculo",
            "descricao":
            "Um grupo em círculo passa a bola o mais rápido possível, estimulando reflexo e visão de jogo.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Passes"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: _buildTreinosList(treinos),
    );
  }

  Widget _buildTreinosList(List treinos) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: treinos.length,
      itemBuilder: (context, index) {
        final bloco = treinos[index];
        return _buildCard(bloco);
      },
    );
  }

  Widget _buildCard(Map bloco) {
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
          bloco["nivel"],
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
  }
}
