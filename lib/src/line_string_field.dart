part of geojson_fields;

/// [LineStringField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "LineString",
///    "coordinates": [
///      [
///        40,
///        5
///      ],
///      [
///        41,
///        6
///      ]
///    ]
///  },
///  {
///    "type": "LineString",
///    "coordinates": [
///      [
///        40,
///        5
///      ],
///      [
///        41,
///        6
///      ]
///    ]
///  }
///]
class LineStringField {
  const LineStringField({
    @required this.type,
    @required this.coordinates
  }) :  assert(type != null),
        assert(coordinates != null);


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the LineStringField.
  final List<List<double>> coordinates;

  /// Parse the incoming json and return a [LineStringField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// LineStringField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory LineStringField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<List<double>> coordinates = [];

    /// Loop over the coordinates and add them to the coordinates list.
    json['coordinates'].forEach((elem) {
      coordinates.add(elem.cast<double>());
    });

    /// Return a [LineStringField] with the variables [type] and [coordinates]
    return LineStringField(
        type: type,
        coordinates: coordinates
    );
  }
}