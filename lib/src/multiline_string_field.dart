part of geojson_fields;

/// [MultiLineStringField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "MultiLineString",
///    "coordinates": [
///      [
///        [ -73.96943, 40.78519 ],
///        [ -73.96082, 40.78095 ]
///      ],
///      [
///        [ -73.96415, 40.79229 ],
///        [ -73.95544, 40.78854 ]
///      ],
///      [
///        [ -73.97162, 40.78205 ],
///        [ -73.96374, 40.77715 ]
///      ],
///      [
///        [ -73.97880, 40.77247 ],
///        [ -73.97036, 40.76811 ]
///      ]
///    ]
///  },
///  {
///    "type": "MultiLineString",
///    "coordinates": [
///      [
///        [ -73.96943, 40.78519 ],
///        [ -73.96082, 40.78095 ]
///      ],
///      [
///        [ -73.96415, 40.79229 ],
///        [ -73.95544, 40.78854 ]
///      ],
///      [
///        [ -73.97162, 40.78205 ],
///        [ -73.96374, 40.77715 ]
///      ],
///      [
///        [ -73.97880, 40.77247 ],
///        [ -73.97036, 40.76811 ]
///      ]
///    ]
///  }
///]

class MultiLineStringField {
  const MultiLineStringField({
    required this.type,
    required this.coordinates
  });


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the MultiLineStringField.
  final List<List<List<double>>> coordinates;

  /// Parse the incoming json and return a [MultiLineStringField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// MultiLineStringField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory MultiLineStringField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<List<List<double>>> coordinates = [];

    /// Loop over the coordinates and add them to the coordinates list.
    json['coordinates'].forEach((elem) {
      List<List<double>> subCoordinates = [];
      elem.forEach((subElem) {
        subCoordinates.add(subElem.cast<double>());
      });
      coordinates.add(subCoordinates);
    });

    /// Return a [MultiLineStringField] with the variables [type] and [coordinates]
    return MultiLineStringField(
        type: type,
        coordinates: coordinates
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'coordinates': coordinates
  };
}