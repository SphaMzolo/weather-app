// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget searchedCity(BuildContext context, String name) {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Center(
          child: Text(
        '$name',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.w100,
        ),
      ))
    ],
  );
}

Widget weatherDescriptionText(String des) {
  return Text(
    des.toUpperCase(),
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  );
}

Widget weatherIcon(String icon) {
  return CachedNetworkImage(
    imageUrl: 'https://openweathermap.org/img/wn/$icon@2x.png',
    color: Colors.indigo,
    height: 100,
    width: 100,
  );
}

Widget dayTemperature(double value) {
  return Text(
    "$value °C",
    style: TextStyle(
      fontSize: 75,
      color: Colors.white,
    ),
  );
}

Widget dayFeelsLike(double value) {
  return Text(
    "Feels Like: $value",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );
}

Widget humidityOfDay(int value) {
  return Text("Humidity: $value",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));
}

Widget sunrise(String value) {
  return Text("Sunrise\n$value",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));
}

Widget sunset(String value) {
  return Text("Sunset\n$value",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));
}

Widget windspeed(double value) {
  return Text("Wind Speed\n$value",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));
}

Widget windpressure(int value) {
  return Text("Wind Pressure\n$value",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));
}
