// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      qualification: json['qualification'] as String,
      yearOfPassing: json['yearOfPassing'] as String,
      grade: json['grade'] as String,
      experience: json['experience'] as String,
      designation: json['designation'] as String,
      domain: json['domain'] as String,
      address: json['address'] as String,
      landmark: json['landmark'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pinCode: json['pinCode'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'password': instance.password,
      'qualification': instance.qualification,
      'yearOfPassing': instance.yearOfPassing,
      'grade': instance.grade,
      'experience': instance.experience,
      'designation': instance.designation,
      'domain': instance.domain,
      'address': instance.address,
      'landmark': instance.landmark,
      'city': instance.city,
      'state': instance.state,
      'pinCode': instance.pinCode,
      'imagePath': instance.imagePath,
    };
