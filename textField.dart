import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:provider/provider.dart';

dialog(
  BuildContext context, {
  TextEditingController? controller,
  var value,
}) {
  return showDialog(
      context: context,
      builder: (_) => Padding(
            padding: const EdgeInsets.only(
              top: 70,
              bottom: 200,
            ),
            child: Dialog(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder(),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Consumer<WeatherApi>(
                    builder: (context, value, child) => TextButton(
                      onPressed: () {
                        value.cityInput = controller!.text;
                        value.getWeather(controller.text);
                        controller.clear();
                        if (value.refreshing) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        value.refreshing ? 'Search again' : 'Search',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}
