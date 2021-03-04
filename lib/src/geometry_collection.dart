part of geojson_fields;

class GeometryCollectionField {
  const GeometryCollectionField({
    required this.type,
    required this.geometries,
    this.multiPoints,
    this.multiLineStrings,
    this.lineStrings,
    this.multiPolygons,
    this.points,
    this.polygons
  });


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [geometries] of the GeometryCollectionField.
  /// This list can contain: MultiPoint, MultiLineString, LineString, MultiPolygon, PointField, PolygonField
  final List<dynamic> geometries;

  /// A list of the [MultiPoint] fields inside the geometries
  final List<MultiPointField>? multiPoints;

  /// A list of the [MultiLineString] fields inside the geometries
  final List<MultiLineStringField>? multiLineStrings;

  /// A list of the [LineString] fields inside the geometries
  final List<LineStringField>? lineStrings;

  /// A list of the [MultiPolygon] fields inside the geometries
  final List<MultiPolygonField>? multiPolygons;

  /// A list of the [PointField] fields inside the geometries
  final List<PointField>? points;

  /// A list of the [PolygonField] fields inside the geometries
  final List<PolygonField>? polygons;

  /// Parse the incoming json and return a [GeometryCollectionField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// GeometryCollectionField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory GeometryCollectionField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<dynamic> geometries = [];

    /// A list of the [MultiPoint] fields inside the geometries
    List<MultiPointField> multiPoints = [];

    /// A list of the [MultiLineString] fields inside the geometries
    List<MultiLineStringField> multiLineStrings = [];

    /// A list of the [LineString] fields inside the geometries
    List<LineStringField> lineStrings = [];

    /// A list of the [MultiPolygon] fields inside the geometries
    List<MultiPolygonField> multiPolygons = [];

    /// A list of the [PointField] fields inside the geometries
    List<PointField> points = [];

    /// A list of the [PolygonField] fields inside the geometries
    List<PolygonField> polygons = [];

    /// Loop over the geometries and add them to the coordinates list.
    json['geometries'].forEach((elem) {
      switch(elem['type']) {
        case fieldMultiPoint:
          geometries.add(MultiPointField.fromJson(Map<String, dynamic>.from(elem)));
          multiPoints.add(MultiPointField.fromJson(Map<String, dynamic>.from(elem)));
          break;
        case fieldMultiLineString:
          geometries.add(MultiLineStringField.fromJson(Map<String, dynamic>.from(elem)));
          multiLineStrings.add(MultiLineStringField.fromJson(Map<String, dynamic>.from(elem)));
          break;
        case fieldLineString:
          geometries.add(LineStringField.fromJson(Map<String, dynamic>.from(elem)));
          lineStrings.add(LineStringField.fromJson(Map<String, dynamic>.from(elem)));
          break;
        case fieldMultiPolygon:
          geometries.add(MultiPolygonField.fromJson(Map<String, dynamic>.from(elem)));
          multiPolygons.add(MultiPolygonField.fromJson(Map<String, dynamic>.from(elem)));
          break;
        case fieldPointField:
          geometries.add(PointField.fromJson(Map<String, dynamic>.from(elem)));
          points.add(PointField.fromJson(Map<String, dynamic>.from(elem)));
          break;
        case fieldPolygonField:
          geometries.add(PolygonField.fromJson(Map<String, dynamic>.from(elem)));
          polygons.add(PolygonField.fromJson(Map<String, dynamic>.from(elem)));
          break;
      }
    });

    /// Return a [GeometryCollectionField] with the variables [type] and [coordinates]
    return GeometryCollectionField(
      type: type,
      geometries: geometries,
      multiPoints: multiPoints,
      multiLineStrings: multiLineStrings,
      lineStrings: lineStrings,
      multiPolygons: multiPolygons,
      points: points,
      polygons: polygons
    );
  }
}