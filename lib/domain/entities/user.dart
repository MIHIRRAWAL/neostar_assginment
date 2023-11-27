import 'package:assignment_neostar/data/models/user.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
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

  UserEntity(
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
      this.imagePath});

  @override
  List<Object?> get props => [id, firstName, lastName];

  @override
  bool get stringify => true;

  User get restore => User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      password: password,
      qualification: qualification,
      yearOfPassing: yearOfPassing,
      grade: grade,
      experience: experience,
      designation: designation,
      domain: domain,
      address: address,
      landmark: landmark,
      city: city,
      state: state,
      pinCode: pinCode,
      imagePath: imagePath);
}
