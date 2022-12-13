import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppConstantData {
  static final List<Map<String, dynamic>> loginProviders = [
    {"icon": FontAwesomeIcons.google, "color": Colors.red},
    {"icon": FontAwesomeIcons.facebook, "color": Colors.blue},
    {"icon": FontAwesomeIcons.twitter, "color": Colors.lightBlue},
  ];

  static final List<Map<String, dynamic>> appBarActions = [
    {"icon": FontAwesomeIcons.magnifyingGlass, "color": Colors.black},
    {"icon": FontAwesomeIcons.filter, "color": Colors.black},
    {"icon": FontAwesomeIcons.circleInfo, "color": Colors.black},
  ];
}
