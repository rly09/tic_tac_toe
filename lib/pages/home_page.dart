import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;
  int filledBoxes = 0;
  int ohScore = 0;
  int exScore = 0;

  List<String> displayExOh = List.filled(9, '');

  void onTap(int index) {
    if (displayExOh[index] != '') return;

    setState(() {
      displayExOh[index] = ohTurn ? 'O' : 'X';
      filledBoxes++;
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var condition in winConditions) {
      String a = displayExOh[condition[0]];
      String b = displayExOh[condition[1]];
      String c = displayExOh[condition[2]];

      if (a != '' && a == b && b == c) {
        _showWinDialog(a);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    if (winner == 'O') {
      ohScore++;
    } else {
      exScore++;
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Winner: $winner'),
        actions: [
          TextButton(
            onPressed: () {
              _clearBoard();
              Navigator.pop(context);
            },
            child: const Text("Play Again!"),
          ),
        ],
      ),
    );
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('It\'s a Draw!'),
        actions: [
          TextButton(
            onPressed: () {
              _clearBoard();
              Navigator.pop(context);
            },
            child: const Text("Play Again!"),
          ),
        ],
      ),
    );
  }

  void _clearBoard() {
    setState(() {
      displayExOh = List.filled(9, '');
      filledBoxes = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final glassColor =
    isDark ? AppColors.darkGlass : AppColors.lightGlass;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Scoreboard
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPlayerScore('Player O', ohScore),
                  _buildPlayerScore('Player X', exScore),
                ],
              ),
            ),

            // Game Board
            Expanded(
              flex: 3,
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: glassColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: displayExOh[index] == 'X'
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'TIC TAC TOE',
                style: GoogleFonts.exo2(
                  fontSize: 30,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerScore(String title, int score) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.rajdhani(
              fontSize: 20,
              letterSpacing: 1,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            score.toString(),
            style: GoogleFonts.rajdhani(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
