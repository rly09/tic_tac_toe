import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import '../theme.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App title
            const Spacer(flex: 1),
            Text(
              'TIC TAC TOE',
              style: GoogleFonts.audiowide(
                textStyle: TextStyle(
                  fontSize: 32,
                  color: theme.colorScheme.onBackground,
                  letterSpacing: 4,
                ),
              ),
            ),

            const Spacer(),

            // Logo with Avatar Glow
            AvatarGlow(
              glowColor: theme.colorScheme.secondary.withOpacity(0.6),
              endRadius: 110,
              duration: const Duration(seconds: 2),
              repeat: true,
              child: CircleAvatar(
                backgroundColor: isDark
                    ? AppColors.darkGlass
                    : AppColors.lightGlass,
                radius: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('lib/images/tictactoe.png'),
                ),
              ),
            ),

            const Spacer(),

            // Let's Play Button
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "LET'S PLAY",
                        style: GoogleFonts.audiowide(
                          fontSize: 18,
                          letterSpacing: 3,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
