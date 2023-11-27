import 'package:assignment_neostar/common/constants/color.dart';
import 'package:assignment_neostar/common/widgets/app_bar.dart';
import 'package:assignment_neostar/common/widgets/label.dart';
import 'package:assignment_neostar/common/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/di/di_container.dart';
import '../../blocs/register/register_bloc.dart';
import 'address_info_page.dart';

class EducationInfoPage extends StatefulWidget {
  const EducationInfoPage({super.key});

  @override
  State<EducationInfoPage> createState() => _EducationInfoPageState();
}

class _EducationInfoPageState extends State<EducationInfoPage> {
  List<String> qualificationList = [
    "Post Graduate",
    "Graduate",
    "HSC/Diploma",
    "SSC"
  ];
  final _formKey1 = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return WillPopScope(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "Your Info",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: BlocBuilder<RegisterBloc, RegisterState>(
              bloc: getItInstance<RegisterBloc>(),
              builder: (context, state) {
                return Form(
                  key: _formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Educational Info"),
                      const LabelTextWidget(
                        label: 'Education*',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: DropdownButtonFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => registerBloc.validateDropdown(
                              value, "Qualification"),
                          value: registerBloc.qualification,
                          hint: const Text(
                            "Select Your Qualification",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          items: qualificationList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              registerBloc.qualification = value,
                        ),
                      ),
                      const LabelTextWidget(
                        label: 'Year of Passing*',
                      ),
                      TextFieldWidget(
                        hintText: "Year of Passing",
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        controller: registerBloc.yearOfPassingController,
                        validator: (value) => registerBloc.validateDropdown(
                            value, "Year of passing"),
                        onTap: () => showYearPicker(registerBloc),
                      ),
                      const LabelTextWidget(
                        label: 'Grade*',
                      ),
                      TextFieldWidget(
                        validator: (value) => registerBloc.validateNumAndChar(
                            value, "Grade or Percentage"),
                        hintText: "Enter your Grade or Percentage",
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.gradeController,
                      ),
                      const Divider(
                        color: ColorConstants.hintColor,
                      ),
                      _buildSectionTitle("Professional Info"),
                      const LabelTextWidget(
                        label: 'Experience*',
                      ),
                      TextFieldWidget(
                        validator: (value) => registerBloc.validateDropdown(
                            value, "Year of Experience"),
                        hintText: "Enter years of experience",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: registerBloc.experienceController,
                      ),
                      const LabelTextWidget(
                        label: 'Designation*',
                      ),
                      TextFieldWidget(
                        validator: (value) => registerBloc.validateNumAndChar(
                            value, "Designation"),
                        hintText: "Enter Designation",
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.designationController,
                      ),
                      const LabelTextWidget(
                        label: 'Domain*',
                      ),
                      TextFieldWidget(
                        validator: (value) =>
                            registerBloc.validateNumAndChar(value, "Domain"),
                        hintText: "Enter Your Domain",
                        textInputAction: TextInputAction.next,
                        controller: registerBloc.domainController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(40.w, 50),
                            ),
                            child: const Text("Previous"),
                          ),
                          ElevatedButton(
                            onPressed: () => goToAddressInfo(),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40.w, 50),
                            ),
                            child: const Text("Next"),
                          ),
                        ],
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

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.sp),
    );
  }

  showYearPicker(RegisterBloc registerBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(1970),
              lastDate: DateTime(DateTime.now().year),
              initialDate: DateTime.now(),
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                registerBloc.yearOfPassingController.text =
                    dateTime.year.toString();
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  goToAddressInfo() {
    if (_formKey1.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddressInfoPage(),
        ),
      );
    }
  }
}
