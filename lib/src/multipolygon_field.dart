part of geojson_fields;

/// [MultiPolygonField]
/// The incoming data looks like this:
/// [
///  {
///    "type": "MultiPolygon",
///    "coordinates": [
///      [
///        [
///          [102.0, 2.0],
///          [103.0, 2.0],
///          [103.0, 3.0],
///          [102.0, 3.0],
///          [102.0, 2.0]
///        ]
///      ],
///      [
///        [
///          [100.0, 0.0],
///          [101.0, 0.0],
///          [101.0, 1.0],
///          [100.0, 1.0],
///          [100.0, 0.0]
///        ],
///        [
///          [100.2, 0.2],
///          [100.2, 0.8],
///          [100.8, 0.8],
///          [100.8, 0.2],
///          [100.2, 0.2]
///        ]
///      ]
///    ]
///  },
///  {
///    "type": "MultiPolygon",
///    "coordinates": [
///      [
///        [
///          [102.0, 2.0],
///          [103.0, 2.0],
///          [103.0, 3.0],
///          [102.0, 3.0],
///          [102.0, 2.0]
///        ]
///      ],
///      [
///        [
///          [100.0, 0.0],
///          [101.0, 0.0],
///          [101.0, 1.0],
///          [100.0, 1.0],
///          [100.0, 0.0]
///        ],
///        [
///          [100.2, 0.2],
///          [100.2, 0.8],
///          [100.8, 0.8],
///          [100.8, 0.2],
///          [100.2, 0.2]
///        ]
///      ]
///    ]
///  }
/// ]
class MultiPolygonField {
  const MultiPolygonField({
    @required this.type,
    @required this.coordinates
  }) :  assert(type != null),
        assert(coordinates != null);


  /// The [type] of the Field, to reconstruct the incoming json data.
  final String type;

  /// The [coordinates] of the MultiPolygonField.
  final List<List<List<List<double>>>> coordinates;

  /// Parse the incoming json and return a [MultiPolygonField]
  /// Usage, assuming that u parse a incoming json source, then the runtime type is a _InternalLinkedHashMap:
  /// MultiPolygonField.fromJson(Map<String, dynamic>.from(elem['location']))
  factory MultiPolygonField.fromJson(Map<String, dynamic> json) {
    /// Create a variable with the type of the Field, to reconstruct the incoming json data.
    String type = json['type'];

    /// Create a variable with a list of a list with coordinates.
    List<List<List<List<double>>>> coordinates = [];

    /// Loop over the coordinates and add them to the coordinates list.
    json['coordinates'].forEach((elem) {
      List<List<List<double>>> subCoordinates = [];
      elem.forEach((subElem) {
        subCoordinates.add(List<List<dynamic>>.from(subElem).map((e) => e.cast<double>()).toList());
      });
      coordinates.add(subCoordinates);
    });

    /// Return a [MultiPolygonField] with the variables [type] and [coordinates]
    return MultiPolygonField(
        type: type,
        coordinates: coordinates
    );
  }
}