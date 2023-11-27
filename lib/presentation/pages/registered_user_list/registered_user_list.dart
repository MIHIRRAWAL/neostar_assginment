import 'dart:io';

import 'package:assignment_neostar/common/constants/color.dart';
import 'package:assignment_neostar/common/widgets/app_bar.dart';
import 'package:assignment_neostar/presentation/blocs/get_all_users/get_all_register_bloc.dart';
import 'package:assignment_neostar/presentation/pages/register/register_view.dart';
import 'package:assignment_neostar/presentation/widgets/registered_user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/assets.dart';

class RegisteredUserList extends StatefulWidget {
  const RegisteredUserList({super.key});

  @override
  State<RegisteredUserList> createState() => _RegisteredUserListState();
}

class _RegisteredUserListState extends State<RegisteredUserList> {
  @override
  void initState() {
    super.initState();

    context.read<GetAllRegisterBloc>().add(GetAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterView(),
            ));
          },
          child: Container(
            alignment: Alignment.center,
            color: ColorConstants.primaryColor,
            height: 65,
            child: const Text(
              "Register",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        appBar: const AppBarWidget(title: "Users"),
        body: WillPopScope(
          onWillPop: () async => true,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<GetAllRegisterBloc, GetAllRegisterState>(
                  builder: (context, state) {
                if (state is GetAllRegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetAllRegisterLoaded) {
                  return ListView.separated(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                insetPadding: const EdgeInsets.all(8.0),
                                content: SizedBox(
                                  height: 480,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: RegisteredUserDetails(
                                      user: state.users[index]),
                                ),
                              );
                            },
                          );
                        },
                        child: AbsorbPointer(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 120,
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: state.users[index].imagePath ==
                                                null ||
                                            state.users[index].imagePath == ""
                                        ? const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ImageAssets.profileImage),
                                          )
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                              File(state
                                                  .users[index].imagePath!),
                                            ),
                                          ),
                                    border: Border.all(
                                        width: 2,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        "${state.users[index].firstName} ${state.users[index].lastName}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "${state.users[index].address}, ${state.users[index].city}",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey.shade400,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey.shade400,
                      );
                    },
                  );
                }
                if (state is GetAllRegisterEmpty) {
                  return const Center(
                    child: Text(
                      "No registered users found",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }
                if (state is GetAllRegisterLoadFailue) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return Container();
              })),
        ));
  }
}
