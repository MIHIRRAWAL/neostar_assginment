part of 'get_all_register_bloc.dart';

sealed class GetAllRegisterEvent extends Equatable {
  const GetAllRegisterEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsers extends GetAllRegisterEvent {}
