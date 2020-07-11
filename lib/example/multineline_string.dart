import 'package:geojson_fields/geojson_fields.dart';

import 'dart:io';
import 'dart:convert';

void main() async {
  List<MultiLineStringField> multiLineStringFields = [];
  final jsonData = await File('./test/multilinestring.json').readAsString().then((fileContents) => json.decode(fileContents));
  for (var elem in jsonData) {
    multiLineStringFields.add(MultiLineStringField.fromJson(Map<String, dynamic>.from(elem)));
  }
  print(multiLineStringFields);
}