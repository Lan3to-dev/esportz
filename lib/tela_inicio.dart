import 'package:flutter/material.dart';
import 'tela_escolha.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: RichText(text: TextSpan(
          text: "Esport",
          style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "Z",
              style: TextStyle(fontSize: 60, backgroundColor: Colors.orange, color: Colors.black, fontWeight: FontWeight.bold),
            )
          ]
        )),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.black,
          ),
          Center(
            child: Image.asset(
              'assets/images/logoApp.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Center(
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaEscolha()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 )
                ),
                child: Text("COMEÇAR", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),

            ),
            ),
          )
        ],
      ),
    );
  }
}
