// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'name_data.g.dart';

@JsonSerializable()
class NameData {
  String firstName;
  String middleName;
  String lastName;

  NameData(this.firstName, this.middleName, this.lastName);

  @override
  String toString() {
    return '$firstName $middleName $lastName';
  }

  Map<String, dynamic> toJson() => _$NameDataToJson(this);
  factory NameData.fromJson(Map<String, dynamic> json) =>
      _$NameDataFromJson(json);
}
