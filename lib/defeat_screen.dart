// defeat_screen.dart
import 'package:flutter/material.dart';

class DefeatScreen extends StatelessWidget {
  final int targetNumber;

  DefeatScreen({required this.targetNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fim do Jogo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Você não conseguiu adivinhar o número!"),
            Text("O número era: $targetNumber"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Volta para a tela inicial
              },
              child: Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
