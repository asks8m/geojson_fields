import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<MultiPointField> multiPointFields = [];
  final jsonData = await File('./test/multipoint.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    multiPointFields.add(MultiPointField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(multiPointFields);
}