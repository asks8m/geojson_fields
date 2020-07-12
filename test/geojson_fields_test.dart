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
    test('LineStringField', () async {
      List<LineStringField> lineStringFields = [];
      final jsonData = await File('./test/linestring.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        lineStringFields.add(LineStringField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(lineStringFields.length, 2);
    });
    test('PointField', () async {
      List<PointField> pointFields = [];
      final jsonData = await File('./test/point.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        pointFields.add(PointField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(pointFields.length, 2);
    });
    test('PolygonField', () async {
      List<PolygonField> polygonFields = [];
      final jsonData = await File('./test/polygon.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        polygonFields.add(PolygonField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(polygonFields.length, 2);
    });
    test('GeometryCollectionField', () async {
      List<GeometryCollectionField> geometryCollectionFields = [];
      final jsonData = await File('./test/geometrycollection.json').readAsString().then((fileContents) => json.decode(fileContents));
      for (var elem in jsonData) {
        geometryCollectionFields.add(GeometryCollectionField.fromJson(Map<String, dynamic>.from(elem)));
      }
      expect(geometryCollectionFields.length, 2);
    });
  });
}
