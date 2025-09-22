import 'package:flutter/material.dart';

class TreinoBloqueioPage extends StatelessWidget {
  const TreinoBloqueioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Posicionamento de bloqueio",
            "descricao":
            "Treinar postura básica de bloqueio: pés afastados, joelhos semiflexionados e braços erguidos prontos para o salto.",
          },
          {
            "titulo": "Salto vertical sem bola",
            "descricao":
            "Executar saltos verticais em frente à rede, focando em coordenação de braços e tempo de impulsão.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Bloqueio individual",
            "descricao":
            "Praticar bloqueios contra bolas levantadas controladas, ajustando o tempo de salto e o alcance das mãos.",
          },
          {
            "titulo": "Bloqueio com deslocamento",
            "descricao":
            "Treinar movimentação lateral rápida na rede e bloqueio, simulando acompanhamento do atacante adversário.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Bloqueio em duplas",
            "descricao":
            "Executar bloqueio coordenado com um companheiro, cobrindo diferentes zonas da rede e sincronizando movimentos.",
          },
          {
            "titulo": "Bloqueio de leitura",
            "descricao":
            "Simular situações de jogo observando o levantador e o atacante, ajustando posicionamento e tempo de bloqueio para neutralizar o ataque.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Bloqueio"),
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
