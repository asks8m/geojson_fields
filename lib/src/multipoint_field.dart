part of geojson_fields;

/// [MultiPointField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "MultiPoint",
///    "coordinates": [
///      [100.0, 0.0],
///      [101.0, 1.0]
///    ]
///  },
///  {
///    "type": "MultiPoint",
///    "coordinates": [
///      [100.0, 0.0],
///      [101.0, 1.0]
///    ]
///  }
/// ]
class MultiPointField {
  const MultiPointField({
    @required this.type,
    @required this.coordinates
  }) :  assert(type != null),
        assert(coordinates != null);

  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the MultiPointField.
  final List<List<double>> coordinates;

  /// Parse the incoming json and return a [MultiPointField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// MultiPointField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory MultiPointField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<List<double>> coordinates = [];

    /// Loop over the coordinates and add them to the coordinates list.
    json['coordinates'].forEach((elem) {
      coordinates.add(List<double>.from(elem));
    });

    /// Return a [MultiPointField] with the variables [type] and [coordinates]
    return MultiPointField(
      type: type,
      coordinates: coordinates
    );
  }
}