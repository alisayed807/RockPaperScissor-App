import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String playerChoice = '?';
  String computerChoice = '?';
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = 'Make your choice!';
  String resultEmoji = "😊";
  final List<String> choices = ['✊', '✋', '✌️'];

  void playGame(String playerSelection) {
    final random = Random();
    final computerSelection = choices[random.nextInt(choices.length)];

    setState(() {
      playerChoice = playerSelection;
      computerChoice = computerSelection;
      determineWinner(playerSelection, computerSelection);
    });
  }

  void determineWinner(String player, String computer) {
    if (player == computer) {
      resultMessage = "It's a tie!";
      resultEmoji = "😐";
    } else if ((player == '✊' && computer == '✌️') ||
        (player == '✋' && computer == '✊') ||
        (player == '✌️' && computer == '✋')) {
      resultMessage = "You win!";
      resultEmoji = "😄";
      playerScore++;
    } else {
      resultMessage = "You lose!";
      resultEmoji = "😞";
      computerScore++;
    }
  }

  void resetGame() {
    setState(() {
      playerChoice = '?';
      computerChoice = '?';
      playerScore = 0;
      computerScore = 0;
      resultMessage = 'Make your choice!';
      resultEmoji = '😊';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          'Rock Paper Scissors',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's Play Rock-Paper-Scissors",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "You: $playerChoice   Computer: $computerChoice",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => playGame('✊'),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/fist.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => playGame('✋'),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/hand-paper.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => playGame('✌️'),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/scissors.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultMessage,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  resultEmoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Your Score: $playerScore",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Computer Score: $computerScore",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.refresh),
              color: Colors.white,
              onPressed: resetGame,
            ),
          ],
        ),
      ),
    );
  }
}