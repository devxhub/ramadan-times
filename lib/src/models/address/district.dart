// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'district.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class District {
 const District({
 this.name,
 this.id,
    this.bn_name,
  this.url,
     this.division_id,
    this.lat,
    this.lon,
  });
  final String? id;
 final String? division_id;
  final String? name;
  final String? bn_name;
  final String? url;
 final String? lat;
  final String? lon;

  /// A necessary factory constructor for creating a new District instance
  /// from a map. Pass the map to the generated `_$DistrictFromJson()` constructor.
  /// The constructor is named after the source class, in this case, District.
  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DistrictToJson`.
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
