part of 'company_list_bloc.dart';



abstract class CompanyListEvent extends Equatable {
  const CompanyListEvent();

  @override
  List<Object> get props => [];
}


class RefreshCompanyListEvent extends CompanyListEvent {
  String? companyId;

  RefreshCompanyListEvent(this.companyId);

  @override
  List<Object> get props => [companyId ?? ''];
}