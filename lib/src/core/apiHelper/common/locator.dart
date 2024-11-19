import 'package:get_it/get_it.dart';
import 'package:projects/src/core/apiHelper/api_client.dart';
import 'package:projects/src/core/apiHelper/api_client_impl.dart';
import 'package:projects/src/core/apiHelper/common/network_client.dart';
import 'package:projects/src/core/apiHelper/common/network_client_impl.dart';
import 'package:projects/src/core/services/shared_pref/shared_pref.dart';
import 'package:projects/src/core/services/shared_pref/shared_pref_impl.dart';
import 'package:projects/src/feature/home/data/userProfile/user_profile_use_case.dart';
import 'package:projects/src/feature/home/data/userProfile/user_profile_use_case_imp.dart';


final getIt = GetIt.instance;

void initializeDependency() {
  getIt.registerFactory<SharedPref>(() => SharedPrefImpl());
  getIt.registerFactory<NetworkClient>(() => NetworkClientImpl());
  getIt.registerFactory<ApiClient>(() => ApiClientImpl());
  getIt.registerFactory<UserProfileUseCase>(() => UserProfileUseCaseImpl());






}
