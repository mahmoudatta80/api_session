import 'package:api_session/data/helpers/db_helper.dart';
import 'package:api_session/ui/screens/layout_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().initDatabase();
  await DbHelper().getDataFromDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}

// https://api.spoonacular.com/recipes/ base url
// https://api.spoonacular.com/recipes/complexSearch recipes end point
// https://api.spoonacular.com/recipes/{id}/information recipe details end point

