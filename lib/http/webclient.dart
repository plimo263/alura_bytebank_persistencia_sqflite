import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void findAll() async {
  final http.Response response =
      await http.get(Uri.parse('http://192.168.0.69:8081/transactions'));
  debugPrint(response.body);
}
