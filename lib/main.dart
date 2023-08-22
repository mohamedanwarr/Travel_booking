import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:travelbooking/Provider/NavigationBarController/MainScreenProvider.dart';
import 'package:travelbooking/Utilis/Constants.dart';

import 'package:travelbooking/Utilis/utilis.dart';
import 'package:travelbooking/firebase_options.dart';
import 'package:travelbooking/ui/%20authentication/UserState/AuthWrapper.dart';

import 'Provider/AuthController/FirebaseServices.dart';
import 'Provider/LnaguageAppController/Changelanguage.dart';
import 'Provider/NavigationBarController/OnBoarding.dart';
import 'Provider/ProfileScreenController/Image provider.dart';
import 'Provider/GetUserDataController/Retriv_User.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LanguageProvider languageProvider = LanguageProvider(); // Load the selected language
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) {
        LanguageProvider();
        languageProvider.loadSelectedLanguage();
        return languageProvider;
      } , // Load the saved language
    ),
     ChangeNotifierProvider(
       create: (context) => MainScreenProvider(),
     ),
    ChangeNotifierProvider(
      create: (context) => OnBoardingscreen(),
    ),
    ChangeNotifierProvider(
      create: (context) => RetriveUser(),
    ),
    ChangeNotifierProvider(
      create: (context) => Imageprovider(),
    ),
    Provider<AuthService>(create: (_) => AuthService())
  ], child: const TravelBooking()));
}

class TravelBooking extends StatelessWidget {
  const TravelBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<LanguageProvider>();
    return MaterialApp(
      scaffoldMessengerKey: Utilis.messageKey,
      theme: ThemeData(
        fontFamily: selected.selectedLanguage == 'ar' ? 'Cairo' : 'PlayfairDisplay',
        colorScheme: ColorScheme.fromSeed(seedColor: MyConstant.maincolor),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      // locale: _locale,
      debugShowCheckedModeBanner: false,
      locale: selected.selectedLanguage == 'ar'
          ? const Locale('ar')
          : const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
