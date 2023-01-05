// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputted_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputtedData _$InputtedDataFromJson(Map<String, dynamic> json) => InputtedData(
      NameData.fromJson(json['nameData'] as Map<String, dynamic>),
      json['age'] as int,
    );

Map<String, dynamic> _$InputtedDataToJson(InputtedData instance) =>
    <String, dynamic>{
      'name': instance.nameData,
      'age': instance.age,
    };
