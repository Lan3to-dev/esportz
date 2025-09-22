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
            "titulo": "Defesa em posição básica",
            "descricao":
            "Praticar a postura defensiva com joelhos flexionados, braços à frente e peso do corpo distribuído, sem bola.",
          },
          {
            "titulo": "Defesa de bolas leves",
            "descricao":
            "Receber bolas lançadas de forma lenta e controlada, focando no posicionamento correto e uso da manchete.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Defesa em deslocamento",
            "descricao":
            "Executar deslocamentos laterais e para frente/trás, defendendo bolas direcionadas para diferentes áreas.",
          },
          {
            "titulo": "Defesa de ataques moderados",
            "descricao":
            "Treinar recepção de ataques controlados, ajustando tempo de reação e amortecimento do impacto da bola.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Defesa de ataque potente",
            "descricao":
            "Praticar a defesa de cortadas rápidas e fortes, trabalhando reflexo, leitura do atacante e resistência.",
          },
          {
            "titulo": "Defesa com cobertura",
            "descricao":
            "Simular situações de jogo cobrindo companheiros em bloqueio, treinando leitura da jogada e posicionamento tático.",
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
