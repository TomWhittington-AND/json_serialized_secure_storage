// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'name_data.dart';

part 'inputted_data.g.dart';

@JsonSerializable()
class InputtedData {
  NameData name;
  int age;

  InputtedData(this.name, this.age);

  @override
  String toString() {
    return '''
nameData: $name
age: $age
''';
  }

  Map<String, dynamic> toJson() => _$InputtedDataToJson(this);
  factory InputtedData.fromJson(Map<String, dynamic> json) =>
      _$InputtedDataFromJson(json);
}
