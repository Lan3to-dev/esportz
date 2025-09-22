import 'package:flutter/material.dart';
import 'VoleiTreinos/treino_ataque.dart';
import 'VoleiTreinos/treino_bloqueio.dart';
import 'VoleiTreinos/treino_defesa.dart';
import 'VoleiTreinos/treino_manchete.dart';
import 'VoleiTreinos/treino_saque.dart';
import 'VoleiTreinos/treino_toque.dart';

class TreinosVolei extends StatelessWidget {
  const TreinosVolei({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      {
        "titulo": "Saque",
        "descricao": "Exercícios para treinar diferentes tipos de saque.",
        "icone": Icons.sports_volleyball,
        "tela": const TreinoSaquePage(),
      },
      {
        "titulo": "Toque",
        "descricao": "Práticas para melhorar o levantamento e a precisão.",
        "icone": Icons.pan_tool,
        "tela": const TreinoToquePage(),
      },
      {
        "titulo": "Manchete",
        "descricao": "Exercícios de recepção e controle de bola baixa.",
        "icone": Icons.back_hand,
        "tela": const TreinoManchetePage(),
      },
      {
        "titulo": "Ataque",
        "descricao": "Treinos de impulsão, força e finalização no ataque.",
        "icone": Icons.flash_on,
        "tela": const TreinoAtaquePage(),
      },
      {
        "titulo": "Defesa",
        "descricao": "Exercícios para melhorar reflexos e cobertura.",
        "icone": Icons.shield,
        "tela": const TreinoDefesaPage(),
      },
      {
        "titulo": "Bloqueio",
        "descricao": "Treinos para aumentar o tempo de salto e bloqueios.",
        "icone": Icons.block,
        "tela": const TreinoBloqueioPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Treinos_Vôlei"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final cat = categorias[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(cat["icone"] as IconData,
                  color: Colors.orange, size: 32),
              title: Text(
                cat["titulo"] as String,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                cat["descricao"] as String,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white70, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => cat["tela"] as Widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
