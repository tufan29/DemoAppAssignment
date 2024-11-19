part of 'user_list_bloc.dart';


abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}


class RefreshUserListEvent extends UserListEvent {
  String? solutionId;

  RefreshUserListEvent(this.solutionId);

  @override
  List<Object> get props => [solutionId ?? ''];
}