// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_data.dart';
import 'package:flutter_application_1/widgets/error_handling.dart';
import 'package:flutter_application_1/widgets/opening_page.dart';
import 'package:flutter_application_1/widgets/textField.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  TextEditingController textController = TextEditingController();
  var value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/theme.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 45, right: 45),
                  child: Column(
                    children: [
                      TextField(
                        controller: TextEditingController(),
                        style: TextStyle(
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
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Consumer<WeatherApi>(
                        builder: (context, value, child) => IconButton(
                          onPressed: () {
                            value.cityInput = textController.text;
                            value.getWeather(textController.text);
                            textController.clear();
                            if (value.refreshing) {
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(
                            Icons.search,
                            size: 27,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Consumer<WeatherApi>(
                    builder: (context, value, child) => SizedBox(
                      height: 550,
                      child: value.emptyData
                          ? noData()
                          : value.weatherInfo.feelslike == null
                              ? error()
                              : weatherFirstPage(context),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // body: RefreshIndicator(
          //   onRefresh: () async {},
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       // ignore: prefer_const_literals_to_create_immutables
          //       children: [
          //         Column(
          //           // ignore: prefer_const_literals_to_create_immutables
          //           children: [
          //             Center(
          //               child: Text(
          //                 'Bloemfontein',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 40.0,
          //                     fontWeight: FontWeight.w100),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Center(
          //               child: Text(
          //                 '22 °C',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 60.0,
          //                 ),
          //               ),
          //             ),
          //             Container(
          //               margin: EdgeInsets.all(25),
          //               child: Stack(
          //                 children: [
          //                   Opacity(
          //                     opacity: 0.85,
          //                     child: ClipPath(
          //                       child: Container(
          //                         color: Colors.grey.shade800,
          //                         height: 300,
          //                         alignment: Alignment.topLeft,
          //                         child: Container(
          //                           padding: EdgeInsets.all(25),
          //                           child: Center(
          //                             child: SingleChildScrollView(
          //                               child: Column(
          //                                 // ignore: prefer_const_literals_to_create_immutables
          //                                 children: [
          //                                   Text(
          //                                     'Description: ',
          //                                     style: TextStyle(
          //                                       fontSize: 22,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 40,
          //                                   ),
          //                                   Text(
          //                                     'Feels Like: ',
          //                                     style: TextStyle(
          //                                       fontSize: 22,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 40,
          //                                   ),
          //                                   Text(
          //                                     'Humidity: ',
          //                                     style: TextStyle(
          //                                       fontSize: 22,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 27,
          //                                   ),
          //                                   ElevatedButton(
          //                                       onPressed: () {},
          //                                       child: Text('Details'),
          //                                       style: ElevatedButton.styleFrom(
          //                                         primary: Colors.orange[700],
          //                                       ))
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
