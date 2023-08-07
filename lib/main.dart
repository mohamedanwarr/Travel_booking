import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Provider/Changelanguage.dart';
import 'package:travelbooking/Utilis/utilis.dart';
import 'package:travelbooking/firebase_options.dart';
import 'package:travelbooking/ui/%20authentication/UserState/AuthWrapper.dart';

import 'Provider/FirebaseServices.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => GoogleSigninProvider(),
    // ),
    Provider<AuthService>(create: (_) => AuthService())
  ], child: const TravelBooking()));
}

class TravelBooking extends StatelessWidget {
  const TravelBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utilis.messageKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthWrapper(),
      // locale: _locale,
      debugShowCheckedModeBanner: false,
      locale: context.watch<LanguageProvider>().selectedLanguage == 'ar'
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
