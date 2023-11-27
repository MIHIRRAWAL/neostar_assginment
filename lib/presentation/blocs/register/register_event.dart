part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ToggleEvent extends RegisterEvent {
  final bool toggle;

  const ToggleEvent(this.toggle);

  @override
  List<Object> get props => [toggle];
}

class ComparePasswordEvent extends RegisterEvent {
  final String confirmPassword;

  const ComparePasswordEvent(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class GenderChangeEvent extends RegisterEvent {
  final String gender;

  const GenderChangeEvent(this.gender);
  @override
  List<Object> get props => [gender];
}

class RegisterSubmitted extends RegisterEvent {
  final FormSubmissionStatus formSubmissionStatus;

  const RegisterSubmitted(this.formSubmissionStatus);
  @override
  List<Object> get props => [formSubmissionStatus];
}
