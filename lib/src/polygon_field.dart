part of geojson_fields;

/// [PolygonField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "Polygon",
///    "coordinates": [
///      [
///        [
///          102.0,
///          2.0
///        ],
///        [
///          103.0,
///          2.0
///        ],
///        [
///          103.0,
///          3.0
///        ],
///        [
///          102.0,
///          3.0
///        ],
///        [
///          102.0,
///          2.0
///        ]
///      ]
///    ]
///  },
///  {
///    "type": "Polygon",
///    "coordinates": [
///      [
///        [
///          102.0,
///          2.0
///        ],
///        [
///          103.0,
///          2.0
///        ],
///        [
///          103.0,
///          3.0
///        ],
///        [
///          102.0,
///          3.0
///        ],
///        [
///          102.0,
///          2.0
///        ]
///      ]
///    ]
///  }
///]
class PolygonField {
  const PolygonField({
    @required this.type,
    @required this.coordinates
  }) :  assert(type != null),
        assert(coordinates != null);


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the PolygonField.
  final List<List<List<double>>> coordinates;

  /// Parse the incoming json and return a [PolygonField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// PolygonField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory PolygonField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<List<List<double>>> coordinates = [];

    /// Loop over the coordinates and add them to the coordinates list.
    json['coordinates'].forEach((elem) {
      coordinates.add(List<List<dynamic>>.from(elem).map((e) => e.cast<double>()).toList());
    });

    /// Return a [PolygonField] with the variables [type] and [coordinates]
    return PolygonField(
        type: type,
        coordinates: coordinates
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'coordinates': coordinates
  };
}