import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:provider/provider.dart';

import 'essential_widget.dart';
import 'mini_widgets.dart';

Widget weatherFirstPage(BuildContext context) => Consumer<WeatherApi>(
      builder: (context, value, child) => Stack(
        children: [
          searchedCity(context, value.citySearched),
          Positioned(
            top: 90,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: essentialWidget(context)),
          ),
        ],
      ),
    );
