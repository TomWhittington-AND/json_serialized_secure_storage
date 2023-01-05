// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputted_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputtedData _$InputtedDataFromJson(Map<String, dynamic> json) => InputtedData(
      name: NameData.fromJson(json['name'] as Map<String, dynamic>),
      age: json['age'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$InputtedDataToJson(InputtedData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'dateTime': instance.dateTime.toIso8601String(),
    };
