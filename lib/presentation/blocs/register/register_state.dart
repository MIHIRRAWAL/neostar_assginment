part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final int dateTime;
  const RegisterState(
      {this.firstName = '',
      this.lastName = '',
      this.toggle = true,
      this.confirmPassword = '',
      this.gender = 'male',
      this.formSubmissionStatus = const InitialFormStatus(),
      this.dateTime = 0});

  RegisterState copyWith(
      {bool? toggle,
      String? confirmPassword,
      String? gender,
      String? firstName,
      String? lastName,
      FormSubmissionStatus? formSubmissionStatus,
      int? dateTime}) {
    return RegisterState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        toggle: toggle ?? this.toggle,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        gender: gender ?? this.gender,
        formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
        dateTime: dateTime ?? this.dateTime);
  }

  final String firstName;
  final String lastName;
  final bool toggle;
  final String confirmPassword;
  final String gender;
  final FormSubmissionStatus formSubmissionStatus;

  bool isEmpty(value) => Validation.isEmpty(value);
  bool isMin3Char(value) => Validation.validateMinChar(value);
  bool isCharactersOnly(value) => Validation.validateCharacters(value);
  bool isValidPhone(value) => Validation.validatePhoneNumberLength(value);
  bool isPasswordSame(password, confpassword) =>
      Validation.validateConfirmPassword(password, confpassword);
  bool isValidPassword(password) => Validation.validatePassword(password);
  bool isValidEmail(email) => Validation.validateEmail(email);
  bool isOnlyCharAndNumber(value) => Validation.validateCharAndNumber(value);
  bool isValidPinCode(value) => Validation.validatePinCode(value);

  @override
  List<Object> get props => [
        firstName,
        lastName,
        toggle,
        confirmPassword,
        gender,
        formSubmissionStatus,
        dateTime
      ];
}

class RegisterInitial extends RegisterState {}
