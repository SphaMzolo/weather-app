import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherApi(),
        )
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteOperator.home,
        onGenerateRoute: RouteOperator.generateRoute,
      ),
    );
  }
}
