import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/pages/main_page.dart';

class RouteOperator {
  static const String home = '/';
  static const String detail = '/SecondPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => MainPage());
      case detail:
        return MaterialPageRoute(builder: (_) => const SecondPage());

      default:
        throw 'Invalid Route';
    }
  }
}
