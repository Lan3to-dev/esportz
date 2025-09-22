import 'package:flutter/material.dart';

class TreinoDriblesPage extends StatelessWidget {
  const TreinoDriblesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Drible estacionário com duas mãos",
            "descricao":
            "O jogador deve quicar a bola com uma mão por 30 segundos e depois trocar para a outra. Ajuda no controle e coordenação.",
          },
          {
            "titulo": "Drible baixo (protetor)",
            "descricao":
            "Driblar a bola mais próxima ao chão (altura do joelho), focando no controle da posse e proteção contra o adversário.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Drible com cones (zigue-zague)",
            "descricao":
            "Coloque 5 a 6 cones em linha. O jogador deve driblar alternando mãos, contornando cada cone até o fim e voltando.",
          },
          {
            "titulo": "Mudança de direção",
            "descricao":
            "O atleta dribla em linha reta e faz mudanças bruscas de direção (crossover, atrás das costas) para simular situações reais.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Drible em velocidade",
            "descricao":
            "Driblar de um lado ao outro da quadra o mais rápido possível, mantendo o controle da bola e alternando mãos.",
          },
          {
            "titulo": "Drible com dois defensores",
            "descricao":
            "Exercício em dupla ou trio: o jogador dribla tentando passar por dois defensores simulando marcação forte.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Dribles"),
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
