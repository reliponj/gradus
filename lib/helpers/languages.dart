import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradus/states.dart';

lang() async {
  String file = await rootBundle.loadString('assets/lang_json.json');
  String jsonString = file;
  Map<String, dynamic> jsonMap = json.decode(jsonString);

  language = jsonMap[languageCode];

}
