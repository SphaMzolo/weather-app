import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:provider/provider.dart';

import 'mini_widgets.dart';

Widget details() => Consumer<WeatherApi>(
      builder: (context, value, child) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            windpressure(value.weatherInfo.pressure!),
            //spacing(y: 20.0),
            windspeed(value.weatherInfo.windspeed!),
            //spacing(y: 20.0),
            sunset(
                '${value.weatherInfo.sunset!.hour}:${value.weatherInfo.sunset!.minute}'),
            //spacing(y: 20.0),
            sunset(
                '${value.weatherInfo.sunrise!.hour}:${value.weatherInfo.sunrise!.minute}'),
          ],
        ),
      ),
    );
