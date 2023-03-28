import 'package:json_annotation/json_annotation.dart';

//通用类型
@JsonSerializable()
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);

  factory GeneralType.fromJson(Map<String, dynamic> json) => GeneralType(
        json['name'] as String,
        json['id'] as String,
      );

  Map<String, dynamic> toJson(GeneralType instance) => <String, dynamic>{
        'name': instance.name,
        'id': instance.id,
      };

  // GeneralType _$GeneralTypeFromJson(Map<String, dynamic> json) => GeneralType(
  //       json['name'] as String,
  //       json['id'] as String,
  //     );

  // Map<String, dynamic> _$GeneralTypeToJson(GeneralType instance) =>
  //     <String, dynamic>{
  //       'name': instance.name,
  //       'id': instance.id,
  //     };
}
