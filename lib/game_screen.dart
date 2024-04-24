import 'dart:math';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final int maxNumber;

  GameScreen({required this.maxNumber});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int targetNumber;
  final TextEditingController controller = TextEditingController();
  String? helperText;
  int attempts = 0;

  @override
  void initState() {
    super.initState();
    targetNumber = Random().nextInt(widget.maxNumber) + 1;
  }

  void guessNumber() {
    if (controller.text.isEmpty) {
      // Mostra uma mensagem de erro se o campo estiver vazio ou não for numérico
      setState(() {
        helperText = "Por favor, insira um número válido.";
      });
      return;
    }

    int? guess = int.tryParse(controller.text);
    if (guess == null) {
      setState(() {
        helperText = "Por favor, insira um número válido.";
      });
      return;
    }

    setState(() {
      attempts++;
    });

    if (guess == targetNumber) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Parabéns!"),
            content: Text("Você acertou! O número era $targetNumber."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o AlertDialog
                  Navigator.of(context).pop(); // Volta para a tela anterior
                },
              ),
            ],
          );
        },
      );
    } else if (attempts < 5) {
      String hint = guess > targetNumber ? "menor" : "maior";
      setState(() {
        helperText = "Tente um número $hint! Tentativas restantes: ${5 - attempts}";
        controller.clear(); // Limpa o campo após uma tentativa
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DefeatScreen(targetNumber: targetNumber),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adivinhe o Número"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Adivinhe um número entre 1 e ${widget.maxNumber}"),
            SizedBox(height: 20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => guessNumber(),
              decoration: InputDecoration(
                hintText: "Digite seu palpite aqui",
                helperText: helperText,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: guessNumber,
              child: Text('Adivinhar'),
            ),
          ],
        ),
      ),
    );
  }
}

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
