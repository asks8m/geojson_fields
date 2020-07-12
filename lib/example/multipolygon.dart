import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<MultiPolygonField> multiPolygonFields = [];
  final jsonData = await File('./multipolygon.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    multiPolygonFields.add(MultiPolygonField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(multiPolygonFields);
}