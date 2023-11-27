import 'dart:io';

import 'package:assignment_neostar/common/constants/assets.dart';
import 'package:assignment_neostar/common/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../blocs/register/register_bloc.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: registerBloc.filePath == null
                      ? const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageAssets.profileImage),
                        )
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(registerBloc.filePath!),
                          ),
                        ),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
              ),
              Positioned(
                right: 0,
                top: 25,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  onTap: () async {
                    registerBloc.filePath =
                        await ImagePickerUtils().pickImage(ImageSource.gallery);
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
