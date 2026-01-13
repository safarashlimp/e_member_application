// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_family_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddFamilyMemberModelImpl _$$AddFamilyMemberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddFamilyMemberModelImpl(
      status: json['Status'] as bool,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddFamilyMemberModelImplToJson(
        _$AddFamilyMemberModelImpl instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      detailId: (json['detail_id'] as num).toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'detail_id': instance.detailId,
    };
