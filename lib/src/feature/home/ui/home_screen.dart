import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/screen_utils.dart';
import 'package:projects/src/feature/home/ui/sub_company_list.dart';
import 'package:projects/src/feature/home/ui/userList_screen.dart';

import '../../../core/utils/helper/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<TabBarModel> tabBarItemList = [
    TabBarModel("Users", "All", '0'),
    TabBarModel("Sub - Company", "All", '1'),
  ];

  @override
  void initState() {
    _controller = TabController(length: tabBarItemList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double tabWidth =
        ScreenUtils().screenWidth(context) / tabBarItemList.length;

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SizedBox(
        width: ScreenUtils().screenWidth(context),
        height: ScreenUtils().screenHeight(context),
        child: Column(
          children: [
            Container(
              width: ScreenUtils().screenWidth(context),
              color: AppColors.colorContainerBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 24.0,
                          backgroundImage:
                              AssetImage("assets/images/icons/usericon.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Test Drivado',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'test@drivado.com',
                              style: TextStyle(
                                  color: Color(0xffAEB1C1),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              shape: BoxShape.circle,
                            ), //
                            child: Center(
                              child: Image.asset(
                                "assets/images/icons/notification.png",
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18, bottom: 18, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(

                            height: 52,
                            decoration: const BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/icons/search.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: TextField(
                                      keyboardType:
                                      TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400),
                                      textCapitalization:
                                      TextCapitalization
                                          .sentences,

                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        hintText:
                                        'Search',
                                        isCollapsed: false,
                                        counter: Offstage(),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/icons/setting.png",
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Container(
                width: ScreenUtils().screenWidth(context) * 0.9,
                decoration: const BoxDecoration(
                  color: Color(0xffEFF0F6),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: TabBar(
                    controller: _controller,
                    unselectedLabelColor: const Color(0xff6A6A6A),
                    labelColor: AppColors.colorBlack1,
                    labelStyle:
                        Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                    indicatorPadding:
                        const EdgeInsets.only(top: 6.0, bottom: 6, left: 0),
                    indicator: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    isScrollable: false,
                    tabs: tabBarItemList.map<Widget>((TabBarModel c) {
                      return SizedBox(
                        width: tabWidth,
                        child: Tab(
                          text: c.name,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  UserListScreen(),
                  SubCompanyList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarModel {
  String name;
  String actionType;
  String count;

  TabBarModel(this.name, this.actionType, this.count);
}
