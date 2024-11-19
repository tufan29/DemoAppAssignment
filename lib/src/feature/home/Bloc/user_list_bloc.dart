import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:projects/src/core/apiHelper/common/locator.dart';
import 'package:projects/src/feature/home/Model/user_list_model.dart';
import 'package:projects/src/feature/home/data/userProfile/user_profile_use_case.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {


  final UserProfileUseCase apiServices = getIt<UserProfileUseCase>();
  UserListBloc() : super(UserListStateInitial()) {
    on<RefreshUserListEvent>((event, emit) async {

      emit(UserListStateInitial());
      try {
        List<UserListModel> userList = [ ];
        final resource = await apiServices.getUserProfileData(requestData: {});
        userList =  (resource.data as List)
            .map((x) => UserListModel .fromJson(x))
            .toList();
        emit(UserListStateLoaded(
            userList

        ));
      } catch (e, stackTrace) {

        emit(const UserListStateFailed('Something went wrong!'));
      }
    });
  }
}

