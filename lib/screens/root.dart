import 'package:do_it/config/constants/strings.dart';
import 'package:do_it/config/constants/theme.dart';
import 'package:do_it/shared/providers/date_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shared/providers/task_provider.dart';
import './home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DateProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Tasks(),
        ),
      ],
      child: MaterialApp(
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
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kAccentColor,
            selectionHandleColor: kAccentColor,
            selectionColor: kAccentColor.withOpacity(0.4),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
