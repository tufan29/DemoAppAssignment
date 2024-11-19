part of 'company_list_bloc.dart';




abstract class CompanyListState extends Equatable {
  const CompanyListState();

  @override
  List<Object> get props => [];
}

class CompanyListStateInitial extends CompanyListState {}

class CompanyListStateLoading extends CompanyListState {
  final List<CompanyListModel> oldList;

  const CompanyListStateLoading(this.oldList);

  @override
  List<Object> get props => [oldList];
}

class CompanyListStateLoaded extends CompanyListState {
  final List<CompanyListModel> CompanyList;


  CompanyListStateLoaded(
      this.CompanyList, );

  @override
  List<Object> get props => [CompanyList, ];
}

class CompanyListStateFailed extends CompanyListState {
  final String error;

  const CompanyListStateFailed(this.error);

  @override
  List<Object> get props => [error];
}