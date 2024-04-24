// home_screen.dart
import 'package:flutter/material.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha o Nível'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Fácil'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(maxNumber: 10),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Médio'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(maxNumber: 50),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Difícil'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(maxNumber: 100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
