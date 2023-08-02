import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Provider/Changelanguage.dart';
import 'package:travelbooking/ui/Splash/SplashScreen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    )
  ], child: const TravelBooking()));
}

class TravelBooking extends StatelessWidget {
  const TravelBooking({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // locale: _locale,
      debugShowCheckedModeBanner: false,
      locale:  context.watch<LanguageProvider>().selectedLanguage == 'ar'
        ? const Locale('ar')
        : const Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
