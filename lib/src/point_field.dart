part of geojson_fields;

/// [PointField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "Point",
///    "coordinates": [
///      40.433,
///      5.4556
///    ]
///  },
///  {
///    "type": "Point",
///    "coordinates": [
///      12.345,
///      5.2343
///    ]
///  }
///]
class PointField {
  const PointField({
    @required this.type,
    @required this.coordinates
  }) :  assert(type != null),
        assert(coordinates != null);


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the PointField.
  final List<double> coordinates;

  /// Parse the incoming json and return a [PointField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// PointField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory PointField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<double> coordinates = json['coordinates'].cast<double>();

    /// Return a [MultiLineStringField] with the variables [type] and [coordinates]
    return PointField(
        type: type,
        coordinates: coordinates
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'coordinates': coordinates
  };
}