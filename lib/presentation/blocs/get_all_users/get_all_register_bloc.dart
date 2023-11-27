import 'package:assignment_neostar/domain/usecases/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user.dart';

part 'get_all_register_event.dart';
part 'get_all_register_state.dart';

class GetAllRegisterBloc
    extends Bloc<GetAllRegisterEvent, GetAllRegisterState> {
  GetAllRegisterBloc({required UserUsecase userUsecase})
      : super(GetAllRegisterInitial()) {
    on<GetAllUsers>(
      (event, emit) async {
        emit(GetAllRegisterLoading());

        final result = await userUsecase.getAll();
        result.fold((l) {
          emit(GetAllRegisterLoadFailue(l.message ?? ""));
        }, (r) {
          if (r.isEmpty) {
            emit(GetAllRegisterEmpty());
          } else {
            emit(GetAllRegisterLoaded(
                users: r, timeStamp: DateTime.now().microsecondsSinceEpoch));
          }
        });
      },
    );
  }
}
