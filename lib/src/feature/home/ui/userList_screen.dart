import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:projects/src/core/services/route_generator.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';
import 'package:projects/src/feature/home/Bloc/user_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  void initState() {
    BlocProvider.of<UserListBloc>(context).add(
        RefreshUserListEvent("0"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        if (state is UserListStateInitial) {
          return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
        }
        if (state is UserListStateLoading && state.oldList.isEmpty) {
          return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
        }
        if(state is UserListStateLoaded) {
          return RefreshIndicator(
            color: AppColors.colorContainerBackground,
            onRefresh: () {
              return Future.delayed(
                  const Duration(milliseconds: 1000), () {
                context
                    .read<UserListBloc>()
                    .add(RefreshUserListEvent(''));
              });
            },
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 5),
                itemCount: state.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return UsersListTile(
                    label: state.userList[index].name,
                    onClicked: () {

                      var data = {
                        "data":state.userList[index],
                        "isUserDetails":true,
                      };
                      Navigator.of(context).pushNamed(
                          RouteGenerator.kUserDetailsPages,arguments: data);
                    },
                  );
                }),
          );
        }
        return const Center(child: Text("No Data Found"));
      },
    );
  }
}


class UsersListTile extends StatelessWidget {
  final String? label;
  late Function()? onClicked;


  UsersListTile({this.label,
    this.onClicked,
    Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
        duration: const Duration(milliseconds: 200),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          if (onClicked != null) onClicked!();
        },
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20, top: 16, bottom: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/images/icons/Frame.png", height: 18, width: 18,),
              const SizedBox(width: 10,),
              Text(label ?? "", style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                  color: AppColors.colorBlack1,
                  fontFamily: AppFontSize.appFontOpenSans,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
            ],
          ),
        ));
  }
}
