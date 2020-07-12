import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<PointField> pointFields = [];
  final jsonData = await File('./point.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    pointFields.add(PointField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(pointFields);
}