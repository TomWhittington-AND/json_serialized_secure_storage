// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'name_data.dart';

part 'inputted_data.g.dart';

@JsonSerializable()
class InputtedData {
  NameData nameData;
  int age;

  InputtedData(this.nameData, this.age);

  @override
  String toString() {
    return '''
nameData: $nameData
age: $age
''';
  }

  Map<String, dynamic> toJson() => _$InputtedDataToJson(this);
  factory InputtedData.fromJson(Map<String, dynamic> json) =>
      _$InputtedDataFromJson(json);
}
