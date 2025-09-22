import 'package:flutter/material.dart';

class TreinoArremessosPage extends StatelessWidget {
  const TreinoArremessosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Arremesso próximo à cesta",
            "descricao":
            "Séries de arremessos de curta distância (bandeja e finalizações próximas), focando postura e mecânica.",
          },
          {
            "titulo": "Layup simples",
            "descricao":
            "Entradas em bandeja com as duas mãos, alternando os lados da quadra. Repetições controladas.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Arremesso após drible",
            "descricao":
            "Drible curto seguido de arremesso de média distância para trabalhar controle e equilíbrio após movimentação.",
          },
          {
            "titulo": "Arremesso em movimento",
            "descricao":
            "Receber passe em corrida e finalizar rapidamente, simulando situações de contra-ataque.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Arremesso contestado",
            "descricao":
            "Treinos com defensor simulando contestação: ajuste de posição, aceleração e arremesso em pouco espaço.",
          },
          {
            "titulo": "Séries por posições",
            "descricao":
            "Sequência de arremessos distribuídos por pontos-chave da quadra (meia distância e linha de 3).",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Arremessos"),
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