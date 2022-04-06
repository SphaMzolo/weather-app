import 'package:flutter/material.dart';

Widget noData() => Flexible(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 40,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Search required city',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );

Widget error() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.white,
          size: 40,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Error: Unidentified City!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
