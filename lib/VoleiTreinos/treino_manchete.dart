import 'package:flutter/material.dart';

class TreinoManchetePage extends StatelessWidget {
  const TreinoManchetePage({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = [
      {
        "nivel": "Iniciante",
        "exercicios": [
          {
            "titulo": "Manchete individual",
            "descricao":
            "Treinar a posição de pernas semiflexionadas, braços unidos e contato correto com a bola, mantendo o controle próximo.",
          },
          {
            "titulo": "Manchete contra a parede",
            "descricao":
            "Executar séries de manchetes contra a parede, focando na precisão, controle da força e altura da bola.",
          },
        ],
      },
      {
        "nivel": "Intermediário",
        "exercicios": [
          {
            "titulo": "Manchete em duplas",
            "descricao":
            "Trocar manchetes com um parceiro, tentando manter a bola no ar o máximo de tempo possível com regularidade.",
          },
          {
            "titulo": "Manchete em deslocamento",
            "descricao":
            "Executar manchetes em movimento lateral e para frente, ajustando o corpo para manter o passe controlado.",
          },
        ],
      },
      {
        "nivel": "Avançado",
        "exercicios": [
          {
            "titulo": "Manchete de defesa",
            "descricao":
            "Praticar manchetes recebendo bolas rápidas e baixas, simulando defesas em situações de ataque adversário.",
          },
          {
            "titulo": "Manchete direcionada",
            "descricao":
            "Treinar passes de manchete visando zonas específicas da quadra (levantador), trabalhando precisão sob pressão.",
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos de Manchete"),
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
