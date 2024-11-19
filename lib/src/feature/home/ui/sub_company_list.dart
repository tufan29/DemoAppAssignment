import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:projects/src/core/Animation/fead_animation.dart';
import 'package:projects/src/core/services/route_generator.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';
import 'package:projects/src/core/utils/screen_utils.dart';
import 'package:projects/src/feature/home/Bloc/company_list_bloc/company_list_bloc.dart';




class SubCompanyList extends StatefulWidget {
  const SubCompanyList({super.key});

  @override
  State<SubCompanyList> createState() => _SubCompanyListState();
}

class _SubCompanyListState extends State<SubCompanyList> {


  @override
  void initState() {
    BlocProvider.of<CompanyListBloc>(context).add(
        RefreshCompanyListEvent("0"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyListBloc, CompanyListState>(
  builder: (context, state) {
      if (state is CompanyListStateInitial) {
        return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
      }
      if (state is CompanyListStateLoading && state.oldList.isEmpty) {
        return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
      }
      if(state is CompanyListStateLoaded) {
        return RefreshIndicator(
          color: AppColors.colorContainerBackground,
          onRefresh: () {
            return Future.delayed(
                const Duration(milliseconds: 1000), () {
              context
                  .read<CompanyListBloc>()
                  .add(RefreshCompanyListEvent(''));
            });
          },
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: state.CompanyList.length,
              itemBuilder: (BuildContext context, int index) {
                return  SubCompanyTile(
                  companyName: state.CompanyList[index].companyName,
                  userList: "No User found ",
                  onClicked: () {

                    var data = {
                      "data":state.CompanyList[index],
                      "isUserDetails":false,
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




class SubCompanyTile extends StatelessWidget {
  final String? companyName;
  final String? userList;
  late Function()? onClicked;
   SubCompanyTile({super.key, this.companyName, this.userList, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4),
        child: Container(
          width: ScreenUtils().screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
            color: Colors.white,
          ),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  iconColor: AppColors.colorBlack,
                  iconSize: 28,
                  expandIcon: Icons.keyboard_arrow_down,
                  collapseIcon: Icons.keyboard_arrow_up,
                  hasIcon: true,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Builder(
                  builder: (context) {
                    final controller = ExpandableController.of(context, required: true)!;
                    return InkWell(
                      onTap: () {
                        if (onClicked != null) onClicked!();
                        controller.toggle();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Row(
                          children: [
                            Image.asset("assets/images/icons/Company.png",
                                height: 18, width: 18, color: controller.expanded
                                  ? const Color(0xffFB4156)
                                  : AppColors.colorBlack1,),
                            const SizedBox(width: 10),
                            Text(
                              companyName ?? "",
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontFamily: AppFontSize.appFontOpenSans,
                                fontSize:  controller.expanded ?15:13,
                                fontWeight:controller.expanded ? FontWeight.w500 :FontWeight.w400,
                                color: controller.expanded
                                    ? const Color(0xffFB4156)
                                    : AppColors.colorBlack1,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                expanded: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(0),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.colorPrimaryText2.withOpacity(0.2),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 8.0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45.0, vertical: 8),
                        child: Text(
                          userList ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                            fontSize: 14,
                            fontFamily: AppFontSize.appFontOpenSans,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorBlack,
                          ),
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                collapsed: Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
