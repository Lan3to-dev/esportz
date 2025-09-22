import 'package:flutter/material.dart';

class TreinoDefesaPage extends StatelessWidget {
  const TreinoDefesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Posição defensiva básica",
            "descricao":
            "Postura baixa, pés afastados, braços ativos. Repetições de deslocamento lateral sem cruzar pés.",
          },
          {
            "titulo": "Reação ao comando",
            "descricao":
            "Trabalhar reflexo: treinador indica direita/esquerda e o atleta reage mantendo postura defensiva.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Um contra um",
            "descricao":
            "Treino de marcação individual em espaço reduzido, foco em antecipação e contenção do drible.",
          },
          {
            "titulo": "Closeout e contestação",
            "descricao":
            "Prática de aproximação ao arremessador (closeout), equilíbrio entre contestar o tiro e evitar infiltração.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Defesa em transição",
            "descricao":
            "Treinar o retorno rápido à defesa após perda de posse: timing, comunicação e recuperação de posição.",
          },
          {
            "titulo": "Defesa coletiva e rotações",
            "descricao":
            "Simulações 4x4/5x5 focadas em coberturas, trocas de marcação e movimentação defensiva coordenada.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Defesa"),
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