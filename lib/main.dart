import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'weather_search_page.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
         title: 'Weather Search',
         home: WeatherSearchPage(),
        ));
  }
}
