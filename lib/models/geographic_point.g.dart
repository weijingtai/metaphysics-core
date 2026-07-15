// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geographic_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeographicPoint _$GeographicPointFromJson(Map<String, dynamic> json) =>
    GeographicPoint(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$GeographicPointToJson(GeographicPoint instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
    };
