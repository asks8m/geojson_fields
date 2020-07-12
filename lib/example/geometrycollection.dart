import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<GeometryCollectionField> geometryCollectionFields = [];
  final jsonData = await File('./geometrycollection.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    geometryCollectionFields.add(GeometryCollectionField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(geometryCollectionFields);
}