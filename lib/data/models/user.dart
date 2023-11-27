// ignore_for_file: overridden_fields

import 'package:assignment_neostar/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class User extends UserEntity {
  int? id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String gender;
  final String password;
  final String qualification;
  final String yearOfPassing;
  final String grade;
  final String experience;
  final String designation;
  final String domain;
  final String address;
  final String landmark;
  final String city;
  final String state;
  final String pinCode;
  String? imagePath;

  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.phone,
      required this.password,
      required this.qualification,
      required this.yearOfPassing,
      required this.grade,
      required this.experience,
      required this.designation,
      required this.domain,
      required this.address,
      required this.landmark,
      required this.city,
      required this.state,
      required this.pinCode,
      this.imagePath})
      : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            landmark: landmark,
            email: email,
            gender: gender,
            phone: phone,
            password: password,
            address: address,
            city: city,
            designation: designation,
            domain: domain,
            experience: experience,
            grade: grade,
            pinCode: pinCode,
            qualification: qualification,
            state: state,
            yearOfPassing: yearOfPassing,
            imagePath: imagePath);

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
