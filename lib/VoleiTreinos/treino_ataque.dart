import 'package:flutter/material.dart';

class TreinoAtaquePage extends StatelessWidget {
  const TreinoAtaquePage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Coordenação de braço",
            "descricao":
            "Praticar o movimento de braço sem bola, focando na elevação do cotovelo, movimento de chicote e finalização correta.",
          },
          {
            "titulo": "Ataque com bola levantada fixa",
            "descricao":
            "Receber bolas levantadas de forma controlada (levantamento alto e previsível) para treinar tempo de salto e contato.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Ataque após deslocamento",
            "descricao":
            "Praticar a aproximação em três ou quatro passos antes do salto, ajustando a corrida para sincronizar com o levantamento.",
          },
          {
            "titulo": "Ataque em duplas",
            "descricao":
            "Em dupla com levantador, treinar ataques de diferentes posições da rede, variando força e direção do golpe.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Ataque contra bloqueio",
            "descricao":
            "Simular situações de jogo atacando contra bloqueadores, treinando mudanças de direção, largadinhas e potência.",
          },
          {
            "titulo": "Ataque tático",
            "descricao":
            "Executar ataques estratégicos mirando zonas específicas da quadra adversária, explorando espaços livres e fraquezas.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Ataque"),
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
