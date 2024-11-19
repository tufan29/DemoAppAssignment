import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:projects/src/feature/home/Model/company_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:projects/src/core/apiHelper/common/locator.dart';
import 'package:projects/src/feature/home/Model/user_list_model.dart';
import 'package:projects/src/feature/home/data/userProfile/user_profile_use_case.dart';
part 'company_list_event.dart';
part 'company_list_state.dart';

class CompanyListBloc extends Bloc<CompanyListEvent, CompanyListState> {
  final UserProfileUseCase apiServices = getIt<UserProfileUseCase>();
  CompanyListBloc() : super(CompanyListStateInitial()) {
    on<RefreshCompanyListEvent>((event, emit) async {

      emit(CompanyListStateInitial());
      try {
        List<CompanyListModel> companyList = [ ];
        final resource = await apiServices.getCompanyProfileData(requestData: {});
        companyList =  (resource.data as List)
            .map((x) => CompanyListModel .fromJson(x))
            .toList();
        emit(CompanyListStateLoaded(
            companyList

        ));
      } catch (e, stackTrace) {

        emit(const CompanyListStateFailed('Something went wrong!'));
      }
    });
  }
}

