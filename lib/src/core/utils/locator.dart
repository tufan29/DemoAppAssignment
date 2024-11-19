import 'package:get_it/get_it.dart';
import 'package:projects/src/core/apiHelper/api_client.dart';
import 'package:projects/src/core/apiHelper/api_client_impl.dart';



final getIt = GetIt.instance;

void initializeDependency() {

  getIt.registerFactory<ApiClient>(() => ApiClientImpl());

}
