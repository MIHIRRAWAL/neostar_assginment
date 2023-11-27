import 'package:assignment_neostar/core/exception/exception.dart';
import 'package:assignment_neostar/domain/entities/user.dart';
import 'package:assignment_neostar/domain/usecases/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/utils/form_submission.dart';
import '../../../common/utils/validation.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserUsecase _userUsecase;

  bool toggle = true;
  String gender = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? qualification;
  TextEditingController yearOfPassingController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  TextEditingController experienceController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  TextEditingController domainController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController landmarkController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  String? userState;

  TextEditingController pinCodeController = TextEditingController();
  String? filePath;

  RegisterBloc({required UserUsecase userUsecase})
      : _userUsecase = userUsecase,
        super(RegisterInitial()) {
    on<ToggleEvent>(_onToggleEvent);
    on<ComparePasswordEvent>(_onComparePassword);
    on<GenderChangeEvent>(_onGenderChanged);
    on<RegisterSubmitted>(_onFormSubmit);
  }

  void _onToggleEvent(ToggleEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(toggle: event.toggle));
  }

  void _onComparePassword(
      ComparePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onGenderChanged(GenderChangeEvent event, Emitter<RegisterState> emit) {
    gender = event.gender;
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onFormSubmit(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
          formSubmissionStatus: event.formSubmissionStatus,
          dateTime: DateTime.now().millisecondsSinceEpoch),
    );

    final failOrUser = await _userUsecase.call(
      UserEntity(
          // id: const Uuid().v4(),
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          gender: 'Male',
          phone: phoneNumberController.text,
          password: passwordController.text,
          qualification: "BE",
          yearOfPassing: yearOfPassingController.text,
          grade: gradeController.text,
          experience: experienceController.text,
          designation: designationController.text,
          domain: domainController.text,
          address: addressController.text,
          landmark: landmarkController.text,
          city: cityController.text,
          state: "Mahrashtra",
          pinCode: pinCodeController.text,
          imagePath: filePath ?? ""),
    );

    failOrUser.fold(
      (failure) {
        AppException.onError(failure);
        emit(
          state.copyWith(
              formSubmissionStatus: SubmissionFailed(
                AppException(),
              ),
              dateTime: DateTime.now().millisecondsSinceEpoch),
        );
      },
      (r) => emit(
        state.copyWith(
            formSubmissionStatus: SubmissionSuccess(),
            dateTime: DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  String? validateName(String? value, String labelText) {
    if (value != null && value.isEmpty) {
      return "$labelText required.";
    }
    if (!state.isCharactersOnly(value!)) {
      return "Accpet only alphabets";
    }
    if (!state.isMin3Char(value)) {
      return "More than 3 characters required.";
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (state.isEmpty(password)) {
      return "Password required.";
    }

    if (state.isValidPassword(password!)) {
      return "Only accept character,number,special character";
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (state.isEmpty(value!)) {
      return "Phone Number required.";
    }
    if (!state.isValidPhone(value)) {
      return "Phone number must be 10 digits only";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (state.isEmpty(value)) {
      return "Email required.";
    }
    if (!state.isValidEmail(value)) {
      return "Incorrect email format";
    }
    return null;
  }

  String? comparePassword(String? password, String? confirmPassword) {
    if (state.isEmpty(confirmPassword)) {
      return "Confirm Password  required.";
    }

    if (state.isPasswordSame(password, confirmPassword)) {
      return "Password does not match";
    }

    return null;
  }

  String? validateDropdown(String? value, String dropdownType) {
    if (value == null || state.isEmpty(value)) {
      return "$dropdownType is required";
    }
    return null;
  }

  String? validateNumAndChar(String? value, String inputType) {
    if (state.isEmpty(value)) {
      return "$inputType is required.";
    }
    if (!state.isOnlyCharAndNumber(value)) {
      return "Only Character and Number accepted";
    }
    return null;
  }

  String? validateAddress(String? value, String inputType) {
    if (state.isEmpty(value)) {
      return "$inputType is required.";
    }

    if (!state.isMin3Char(value)) {
      return "More than 3 characters required.";
    }

    return null;
  }

  String? validatePincode(String? value) {
    if (state.isEmpty(value)) {
      return "Pincode is required.";
    }

    if (!state.isValidPinCode(value)) {
      return "Must be 6 digits only.";
    }

    return null;
  }
}
