import 'package:assignment_neostar/core/di/di_container.dart';
import 'package:assignment_neostar/presentation/blocs/get_all_users/get_all_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/di_container.dart' as di;
import 'package:assignment_neostar/common/theme/theme.dart';
import 'package:assignment_neostar/common/utils/utils.dart';
import 'package:assignment_neostar/presentation/pages/registered_user_list/registered_user_list.dart';
import 'package:sizer/sizer.dart';
import 'presentation/blocs/register/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getItInstance<RegisterBloc>(),
          ),
          BlocProvider(
            create: (_) => getItInstance<GetAllRegisterBloc>(),
          )
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            scaffoldMessengerKey: SnackBarWidget.scaffoldMesenger,
            title: 'Assignment',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const RegisteredUserList(),
          );
        }));
  }
}
