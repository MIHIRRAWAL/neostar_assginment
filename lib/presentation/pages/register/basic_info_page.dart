import 'package:assignment_neostar/common/constants/color.dart';
import 'package:assignment_neostar/common/widgets/app_bar.dart';
import 'package:assignment_neostar/common/widgets/label.dart';
import 'package:assignment_neostar/common/widgets/textfield.dart';
import 'package:assignment_neostar/presentation/blocs/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../widgets/image_picker.dart';
import 'education_info_page.dart';

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      appBar: AppBarWidget(
        title: "Register",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async => true,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      const ImagePickerWidget(),
                      const LabelTextWidget(
                        label: 'First Name*',
                      ),
                      TextFieldWidget(
                        hintText: "Enter you first name",
                        prefixIconData: const Icon(Icons.person),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (value) =>
                            registerBloc.validateName(value, "First Name"),
                        controller: registerBloc.firstNameController,
                      ),
                      const LabelTextWidget(
                        label: 'Last Name*',
                      ),
                      TextFieldWidget(
                        hintText: "Enter you last name",
                        prefixIconData: const Icon(Icons.person),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (value) =>
                            registerBloc.validateName(value, "Last Name"),
                        controller: registerBloc.lastNameController,
                      ),
                      const LabelTextWidget(
                        label: 'Phone*',
                      ),
                      TextFieldWidget(
                        hintText: "Enter you phone number",
                        prefixIconData: const Icon(Icons.phone),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) =>
                            registerBloc.validatePhoneNumber(value),
                        controller: registerBloc.phoneNumberController,
                      ),
                      const LabelTextWidget(
                        label: 'Email*',
                      ),
                      TextFieldWidget(
                        hintText: "Your email goes here",
                        prefixIconData: const Icon(Icons.mail),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => registerBloc.validateEmail(value),
                        controller: registerBloc.emailController,
                      ),
                      const LabelTextWidget(
                        label: 'Gender*',
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 'male',
                                fillColor: MaterialStateProperty.all<Color>(
                                    ColorConstants.primaryColor),
                                groupValue: state.gender,
                                onChanged: (value) => changeGenderEvent(value!),
                              ),
                              const Text("Male")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                fillColor: MaterialStateProperty.all<Color>(
                                    ColorConstants.primaryColor),
                                value: 'female',
                                groupValue: state.gender,
                                onChanged: (value) => changeGenderEvent(value!),
                              ),
                              const Text("Female")
                            ],
                          )
                        ],
                      ),
                      const LabelTextWidget(
                        label: 'Password*',
                      ),
                      TextFieldWidget(
                        prefixIconData: const Icon(Icons.lock),
                        hintText: "Password",
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.passwordController,
                        obscureText: state.toggle,
                        suffixIcon: IconButton(
                          onPressed: () => _togglePassword(registerBloc),
                          icon: Icon(
                            state.toggle
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        validator: (value) =>
                            registerBloc.validatePassword(value),
                      ),
                      const LabelTextWidget(
                        label: 'Confirm Password*',
                      ),
                      TextFieldWidget(
                        prefixIconData: const Icon(Icons.lock),
                        controller: registerBloc.confirmPasswordController,
                        hintText: "Password",
                        validator: (value) =>
                            comparePassword(value, registerBloc),
                        onChanged: (value) =>
                            comparePassword(value, registerBloc),
                        textInputAction: TextInputAction.next,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () => goEducationInfo(),
                        child: const Text("Next"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _togglePassword(RegisterBloc registerBloc) {
    registerBloc.toggle = !registerBloc.toggle;
    registerBloc.add(ToggleEvent(registerBloc.toggle));
  }

  String? comparePassword(String? value, RegisterBloc registerBloc) {
    return registerBloc.comparePassword(
        value, registerBloc.passwordController.text);
  }

  void comparePasswordEvent(String value, RegisterBloc registerBloc) {
    registerBloc.add(ComparePasswordEvent(value));
  }

  void changeGenderEvent(String gender) {
    context.read<RegisterBloc>().add(GenderChangeEvent(gender));
  }

  String? validateName(
      {required String? value,
      required RegisterBloc registerBloc,
      required LabelTextWidget}) {
    return registerBloc.validateName(value, LabelTextWidget);
  }

  void goEducationInfo() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EducationInfoPage(),
        ),
      );
    }
  }
}
