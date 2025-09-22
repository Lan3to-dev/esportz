import 'package:flutter/material.dart';

class TreinoSaquePage extends StatelessWidget {
  const TreinoSaquePage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Saque por baixo",
            "descricao":
            "Praticar o saque por baixo para aprender a coordenação básica de movimento. Foco em contato com a bola e direção.",
          },
          {
            "titulo": "Saque parado",
            "descricao":
            "Executar o saque com os pés fixos, concentrando-se na postura e regularidade do lançamento da bola.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Saque por cima (fundamental)",
            "descricao":
            "Treinar o saque por cima com foco em força e precisão. Trabalhar lançamento consistente e contato firme.",
          },
          {
            "titulo": "Saque direcionado",
            "descricao":
            "Executar saques mirando zonas específicas da quadra adversária para desenvolver controle e estratégia.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Saque viagem",
            "descricao":
            "Praticar o saque viagem com salto, visando potência e velocidade. Trabalhar sincronização de lançamento, salto e golpe.",
          },
          {
            "titulo": "Saque tático",
            "descricao":
            "Simular situações de jogo escolhendo o tipo de saque conforme a estratégia (explorar fraqueza de recebedores).",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Saque"),
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
