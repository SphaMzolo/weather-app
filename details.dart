// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:flutter_application_1/widgets/essential_widget.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade400,
        appBar: AppBar(
          title: Consumer<WeatherApi>(
              builder: (context, value, child) =>
                  Text("Weather Details of ${value.citySearched}")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: essentialWidget(context, detail: true),
              )
            ],
          ),
        ));
  }
}
