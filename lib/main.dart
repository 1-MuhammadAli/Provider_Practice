import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/favorite_provider.dart';
import 'package:provider_practice/screens/count_example.dart';
import 'package:provider_practice/screens/example_one.dart';
import 'package:provider_practice/screens/favorite_screen.dart';
import 'package:provider_practice/why_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => CountProvider(),),
        ChangeNotifierProvider(create:(_) => ExampleOneProvider(),),
        ChangeNotifierProvider(create:(_) => FavouriteItemProvider(),),
      ],
      child:MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  FavoriteScreen(),
      ),
    );
  }
}


