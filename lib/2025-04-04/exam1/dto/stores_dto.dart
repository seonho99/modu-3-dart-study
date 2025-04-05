import 'package:json_annotation/json_annotation.dart';

class StoresDto {
  final String? addr;
  final String? code;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final num? lat;
  final num? lng;
  final String? name;
  @JsonKey(name: 'remain_state')
  final String? remainState;
  @JsonKey(name: 'stock_at')
  final DateTime? stockAt;
  final String? type;

  const StoresDto({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainState,
    this.stockAt,
    this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'createdAt': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remainState': remainState,
      'stockAt': stockAt,
      'type': type,
    };
  }

  factory StoresDto.fromJson(Map<String, dynamic> json) {
    return StoresDto(
      addr: json['addr'] as String?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as DateTime?,
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
      name: json['name'] as String?,
      remainState: json['remainState'] as String?,
      stockAt: json['stockAt'] as DateTime?,
      type: json['type'] as String?,
    );
  }
}
