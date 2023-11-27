import 'dart:developer';

import 'package:assignment_neostar/common/utils/form_submission.dart';
import 'package:assignment_neostar/common/widgets/app_bar.dart';
import 'package:assignment_neostar/common/widgets/textfield.dart';
import 'package:assignment_neostar/presentation/blocs/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registered_user_list/registered_user_list.dart';

class AddressInfoPage extends StatefulWidget {
  const AddressInfoPage({super.key});

  @override
  State<AddressInfoPage> createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  List<String> stateList = [
    "Maharashtra",
    "Gujrat",
    "Karnataka",
    "Madhya Pradesh",
    "Delhi",
    "Others"
  ];

  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return WillPopScope(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "Your Address",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                log("$state", name: "BLOC");
                if (state.formSubmissionStatus is SubmissionSuccess) {
                  log("$state", name: "BLOC1");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisteredUserList(),
                    ),
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        hintText: "Address",
                        prefixIconData: const Icon(Icons.apartment),
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.addressController,
                        validator: (value) =>
                            registerBloc.validateAddress(value, "Address"),
                      ),
                      TextFieldWidget(
                        hintText: "Landmark",
                        prefixIconData: const Icon(Icons.apartment),
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.landmarkController,
                        validator: (value) =>
                            registerBloc.validateAddress(value, "Landmark"),
                      ),
                      TextFieldWidget(
                        hintText: "City",
                        prefixIconData: const Icon(Icons.apartment),
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.cityController,
                        validator: (value) =>
                            registerBloc.validateAddress(value, "City"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          value: registerBloc.userState,
                          hint: const Text(
                            "Select Your State",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          items: stateList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          validator: (value) =>
                              registerBloc.validateDropdown(value, "State"),
                          onChanged: (value) {
                            registerBloc.userState = value;
                          },
                        ),
                      ),
                      TextFieldWidget(
                        hintText: "Pin Code",
                        prefixIconData: const Icon(Icons.apartment),
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.pinCodeController,
                        validator: (value) =>
                            registerBloc.validatePincode(value),
                      ),
                      ElevatedButton.icon(
                        icon: state.formSubmissionStatus is FormSubmitting
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const SizedBox(),
                        onPressed: () => submitForm(registerBloc),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        label: const Text("Submit"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
    );
  }

  submitForm(RegisterBloc registerBloc) {
    if (_formKey2.currentState!.validate()) {
      registerBloc.add(
        RegisterSubmitted(
          FormSubmitting(),
        ),
      );
    }
  }
}
