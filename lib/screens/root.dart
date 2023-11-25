import 'package:do_it/config/constants/strings.dart';
import 'package:do_it/config/constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import './home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      color: kAccentColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge:
              GoogleFonts.bebasNeueTextTheme().displayLarge?.copyWith(
                    color: kAccentColor,
                    fontSize: 45.78,
                    fontWeight: FontWeight.bold,
                  ),
          headlineMedium:
              GoogleFonts.bebasNeueTextTheme().headlineMedium?.copyWith(
                    color: kSecondaryColor,
                    fontSize: 29.3,
                    fontWeight: FontWeight.bold,
                  ),
          headlineSmall:
              GoogleFonts.bebasNeueTextTheme().headlineSmall?.copyWith(
                    color: kSecondaryColor,
                    fontSize: 18.75,
                    fontWeight: FontWeight.bold,
                  ),
          bodyLarge: GoogleFonts.montserratTextTheme().bodyLarge?.copyWith(
                color: kSecondaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 18.75,
              ),
          bodyMedium: GoogleFonts.montserratTextTheme().bodyMedium?.copyWith(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
          bodySmall: GoogleFonts.montserratTextTheme().bodySmall?.copyWith(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 9.6,
              ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
