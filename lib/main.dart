import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurs_sabak9/screens/chat_screen.dart';
import 'package:kurs_sabak9/screens/home_screen.dart';
import 'package:kurs_sabak9/screens/login_screen.dart';
import 'package:kurs_sabak9/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Versiya 1
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const HomeScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/login': (context) => const LoginScreen(),
      //   '/register': (context) => const RegisterScreen(),
      //   '/chat': (context) => const ChatScreen(),
      // },
      //VErsiya 2
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        // 'login_screen': (context) => LoginScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      // home: HomeScreen(), // route tor koldonulsa bul chakirilbayt
    );
  }
}
