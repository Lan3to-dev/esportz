 import 'package:flutter/material.dart';
import 'BasqueteTreinos/treino_drible.dart';
import 'BasqueteTreinos/treino_passes.dart';
import 'BasqueteTreinos/treino_arremesso.dart';
import 'BasqueteTreinos/treino_defesa.dart';
import 'BasqueteTreinos/treino_jogos.dart';



 // ====== Tela principal de Treinos ======
 class TreinosBasquete extends StatelessWidget {
   const TreinosBasquete({super.key});

   @override
   Widget build(BuildContext context) {
     final categorias = [
       {
         "titulo": "Dribles",
         "descricao": "Exercícios para melhorar o controle de bola e ultrapassagem.",
         "icone": Icons.sports_basketball,
         "tela": const TreinoDriblesPage(),
       },
       {
         "titulo": "Passes",
         "descricao": "Treinos focados em passes rápidos e precisos.",
         "icone": Icons.swap_horiz,
         "tela": const TreinoPassesPage(),
       },
       {
         "titulo": "Arremessos",
         "descricao": "Práticas para desenvolver diferentes tipos de arremesso.",
         "icone": Icons.sports,
         "tela": const TreinoArremessosPage(),
       },
       {
         "titulo": "Defesa",
         "descricao": "Exercícios para posicionamento e marcação eficaz.",
         "icone": Icons.shield,
         "tela": const TreinoDefesaPage(),
       },
       {
         "titulo": "Jogos Divertidos",
         "descricao": "Atividades lúdicas para treinar de forma descontraída.",
         "icone": Icons.emoji_events,
         "tela": const TreinoJogosPage(),
       },
     ];

     return Scaffold(

       appBar: AppBar(
         title: const Text("Treinos_basquete"),
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
               leading: Icon(cat["icone"] as IconData, color: Colors.orange, size: 32),
               title: Text(
                 cat["titulo"] as String,
                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
               ),
               subtitle: Text(
                 cat["descricao"] as String,
                 style: const TextStyle(color: Colors.white70),
               ),
               trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
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



