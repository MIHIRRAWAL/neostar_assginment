part of 'get_all_register_bloc.dart';

abstract class GetAllRegisterState extends Equatable {
  const GetAllRegisterState();

  @override
  List<Object> get props => [];
}

final class GetAllRegisterInitial extends GetAllRegisterState {}

class GetAllRegisterEmpty extends GetAllRegisterState {}

class GetAllRegisterLoading extends GetAllRegisterState {}

class GetAllRegisterLoaded extends GetAllRegisterState {
  final List<User> users;
  final int timeStamp;
  const GetAllRegisterLoaded({required this.users, required this.timeStamp});
  @override
  List<Object> get props => [users];
}

class GetAllRegisterLoadFailue extends GetAllRegisterState {
  final String message;

  const GetAllRegisterLoadFailue(this.message);
}
