import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';
import 'mini_widgets.dart';
import 'more_info.dart';

Widget essentialWidget(BuildContext context, {bool detail = false}) =>
    Consumer<WeatherApi>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          weatherDescriptionText(value.weatherInfo.weatherDescription!),
          weatherIcon(value.weatherInfo.weatherIcon!),
          dayTemperature(value.weatherInfo.temperature!),
          dayFeelsLike(value.weatherInfo.feelslike!),
          humidityOfDay(value.weatherInfo.humidity!),
          detail
              ? details()
              :

              ///spacing(y: 2.0),
              detail
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteOperator.detail);
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(child: Text('View Details')),
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
