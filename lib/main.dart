import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';

import 'package:habit_tracker/pages/home_page.dart';
import 'package:habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize the database

  await HabitDatabase.initialize();
  await HabitDatabase.saveFirstLaunchDate();
  runApp(
    MultiProvider(
      providers: [
        //habit provider
        ChangeNotifierProvider(create: (context) => HabitDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
