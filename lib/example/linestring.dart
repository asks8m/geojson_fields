import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<LineStringField> lineStringFields = [];
  final jsonData = await File('./linestring.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    lineStringFields.add(LineStringField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(lineStringFields);
}