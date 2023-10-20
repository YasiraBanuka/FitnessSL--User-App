import 'package:firebase_core/firebase_core.dart';
import 'package:fitnesssl/constants.dart';
import 'package:provider/provider.dart';
import 'package:fitnesssl/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:fitnesssl/services/auth/auth_gate.dart';
import 'package:fitnesssl/services/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessSL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: darkBlue,
        secondaryHeaderColor: darkBlue,
        scaffoldBackgroundColor: darkBlue,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: darkBlue,
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthGate(),
    );
  }
}
