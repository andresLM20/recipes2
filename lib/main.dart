import 'package:flutter/material.dart';
import 'package:recipes2/views/home.dart';
import 'package:recipes2/views/recipe_details.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: SplashScreenView(
        duration: 3000,
        navigateRoute: HomePage(),
        backgroundColor: Colors.yellow[700],
        imageSrc: "assets/recetas.png",
        imageSize: 150,
        text: "Mis Recetas",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
      routes: {
        '/detail': (BuildContext context) => RecipeDetail(),
      },
    );
  }
}
