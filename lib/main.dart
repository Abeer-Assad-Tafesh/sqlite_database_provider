 import 'package:flutter/material.dart';
import 'package:sqlite_database_provider/database/db_controller.dart';
import 'package:sqlite_database_provider/screens/create_contact_screen.dart';
import 'package:sqlite_database_provider/screens/home_screen.dart';
import 'package:sqlite_database_provider/screens/launch_screen.dart';

void main() async {
/*
   To execute any process before the root attachment ...
   we should but it ...
   between [WidgetsFlutterBinding.ensureInitialized(); and runApp()].
*/
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/create_contact_screen': (context) => const CreateContactScreen()
      },
    );
  }
}

