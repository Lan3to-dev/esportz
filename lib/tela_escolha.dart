import 'package:flutter/material.dart';
import 'basquete.dart';
import 'futebol.dart';
import 'volei.dart';

class TelaEscolha extends StatelessWidget {
  const TelaEscolha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de seleção", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

        backgroundColor: Colors.orange,
      ),
      body: Stack(

      children: [
        Container(
          color: Colors.black,
          padding: EdgeInsets.all(16),
        ),
       Positioned(
        top: 30,
        left: 0,
        right: 0,
        child: Center(
          child: Text("Aprenda / Pratique um esporte", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
        ),
       ),
        
       Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BasquetePage()));
              },
              icon: Icon(Icons.sports_basketball, color: Colors.black,  fontWeight: FontWeight.bold, size: 40,),
              label: const Text("Basquete", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FutebolPage()));
              },
              icon: Icon(Icons.sports_soccer, color: Colors.black, fontWeight: FontWeight.bold, size: 40,),
              label: const Text("Futebol", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VoleiPage()));
              },
              icon: Icon(Icons.sports_volleyball, color: Colors.black, fontWeight: FontWeight.bold, size: 40,),
              label: const Text("Vôlei", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    ],
    ),
    );
  }
}
