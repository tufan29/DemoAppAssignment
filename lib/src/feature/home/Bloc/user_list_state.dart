part of 'user_list_bloc.dart';

// @immutable
// sealed class UserListState {}
//
// final class UserListInitial extends UserListState {}


abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListStateInitial extends UserListState {}

class UserListStateLoading extends UserListState {
  final List<UserListModel> oldList;

  const UserListStateLoading(this.oldList);

  @override
  List<Object> get props => [oldList];
}

class UserListStateLoaded extends UserListState {
  final List<UserListModel> userList;


  UserListStateLoaded(
      this.userList, );

  @override
  List<Object> get props => [userList, ];
}

class UserListStateFailed extends UserListState {
  final String error;

  const UserListStateFailed(this.error);

  @override
  List<Object> get props => [error];
}