import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:projects/src/core/apiHelper/common/locator.dart';
import 'package:projects/src/core/services/route_generator.dart';
import 'package:projects/src/feature/home/Bloc/user_list_bloc.dart';

import 'src/feature/home/Bloc/company_list_bloc/company_list_bloc.dart';


void main() {
  initializeDependency();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserListBloc>(
        create: (context) => UserListBloc(),
      ),
      BlocProvider<CompanyListBloc>(
        create: (context) => CompanyListBloc(),
      ),
      // Add more BlocProviders as needed
    ],
    child: const MyApp(), // Replace with your main app widget
  ),);

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown, // Set the app's primary theme color
      ),
      title: 'Demo App',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      navigatorKey: RouteGenerator.navigatorKey,
      themeMode: ThemeMode.dark,
      initialRoute: RouteGenerator.kSplash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
