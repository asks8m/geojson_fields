import 'package:flutter_test/flutter_test.dart';

import 'dart:io';
import 'dart:convert';

import 'package:geojson_fields/geojson_fields.dart';

void main() {
  group("geojson_fields_test", () {
    test('MultiLineStringField', () async {
      List<MultiLineStringField> multiLineStringFields = [];
      final jsonData = await File('./test/multilinestring.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        multiLineStringFields.add(MultiLineStringField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(multiLineStringFields.length, 2);
    });
    test('MultiPolygonField', () async {
      List<MultiPolygonField> multiPolygonFields = [];
      final jsonData = await File('./test/multipolygon.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        multiPolygonFields.add(MultiPolygonField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(multiPolygonFields.length, 2);
    });
    test('MultiPointField', () async {
      List<MultiPointField> multiPointFields = [];
      final jsonData = await File('./test/multipoint.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        multiPointFields.add(MultiPointField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(multiPointFields.length, 2);
    });
  });
}
