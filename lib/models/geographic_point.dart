import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geographic_point.g.dart';

/// Pure geographic primitive for metaphysics calculations.
/// 
/// Replaces platform-bound or UI-bound Location/Address models.
@JsonSerializable()
class GeographicPoint extends Equatable {
  final double latitude;
  final double longitude;
  final double altitude;

  const GeographicPoint({
    required this.latitude,
    required this.longitude,
    this.altitude = 0.0,
  });

  factory GeographicPoint.fromJson(Map<String, dynamic> json) => _$GeographicPointFromJson(json);
  Map<String, dynamic> toJson() => _$GeographicPointToJson(this);

  @override
  List<Object?> get props => [latitude, longitude, altitude];
}
