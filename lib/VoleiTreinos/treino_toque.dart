import 'package:flutter/material.dart';

class TreinoToquePage extends StatelessWidget {
  const TreinoToquePage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Toque parado",
            "descricao":
            "Realizar o toque com os pés fixos no chão, focando na postura correta, posição das mãos e precisão do movimento.",
          },
          {
            "titulo": "Toque contra a parede",
            "descricao":
            "Praticar séries de toques contra a parede, controlando altura e direção da bola, mantendo o movimento contínuo.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Toque em duplas",
            "descricao":
            "Exercício de toques alternados em dupla, buscando manter a bola no ar o máximo de tempo possível com controle e regularidade.",
          },
          {
            "titulo": "Toque em deslocamento",
            "descricao":
            "Executar o toque enquanto se movimenta lateralmente ou para frente/trás, simulando deslocamentos de jogo.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Toque em situação de jogo",
            "descricao":
            "Simular levantamentos rápidos e precisos em diferentes posições da quadra, visando atacar em seguida.",
          },
          {
            "titulo": "Toque sob pressão",
            "descricao":
            "Praticar o toque com tempo reduzido e situações de marcação, treinando tomada de decisão rápida e precisão.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Toque"),
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
