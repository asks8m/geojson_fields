import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<PolygonField> polygonFields = [];
  final jsonData = await File('./polygon.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    polygonFields.add(PolygonField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(polygonFields);
}