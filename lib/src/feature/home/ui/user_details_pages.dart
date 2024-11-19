import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/common_utils.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/feature/home/Model/company_list_model.dart';

import '../Model/user_list_model.dart';

class UserDetailsPages extends StatefulWidget {
  UserListModel userDetails;

  CompanyListModel companyDetails;

  bool isUserDetails;

  UserDetailsPages(
      {super.key,
      required this.userDetails,
      required this.isUserDetails,
      required this.companyDetails});

  @override
  State<UserDetailsPages> createState() => _UserDetailsPagesState();
}

class _UserDetailsPagesState extends State<UserDetailsPages> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            //color: AppColors.colorBlack ,
            color: const Color(0xff190C0C),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18.0,
                        )),
                      ),
                    ),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                        SizedBox(
                          width: 15.0,
                        ),
                        CircleAvatar(
                          radius: 24.0,
                          backgroundImage:
                              AssetImage("assets/images/icons/usericon.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: containerDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.isUserDetails
                                      ? 'User Details'
                                      : 'Company Details',
                                  style: const TextStyle(
                                      color: Color(0xff6B7280),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text(
                                     ( widget.isUserDetails
                                          && (widget.userDetails.isActive ??
                                          false))? 'Deactivate':'Activate',
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff8B8B94),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Transform.scale(
                                      scale: 0.7,
                                      // Adjust scale (e.g., 1.5 = 150% larger)
                                      child: CupertinoSwitch(
                                        value: widget.isUserDetails
                                            ? (widget.userDetails.isActive ??
                                                false)
                                            : true,
                                        onChanged: (bool value) {
                                          setState(() {
                                            isActive = value;
                                          });
                                        },
                                        activeColor:
                                            CupertinoColors.activeGreen,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CommonUtils.stringToImage(
                                    value: widget.isUserDetails
                                    ? (widget.userDetails.avatar ?? "")
                                    : (widget.companyDetails.logo ?? ""),
                                    //value: 'https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    width: 70,height: 70,radius: 50,fit: BoxFit.cover),
                              ),

                              const SizedBox(
                                width: 14.0,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.isUserDetails
                                          ? (widget.userDetails.name ?? "")
                                          : (widget
                                                  .companyDetails.companyName ??
                                              ""),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      widget.isUserDetails
                                          ? (widget.userDetails.email ?? "")
                                          : (widget.companyDetails.email ?? ""),
                                      style: const TextStyle(
                                          color: Color(0xff2A2D3D),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          CommonText(
                            label: widget.isUserDetails ? 'Name ' : 'Website',
                            icon:
                                widget.isUserDetails ? "Frame.png" : "web.png",
                            labelValue: widget.isUserDetails
                                ? (widget.userDetails.name ?? "")
                                : (widget.companyDetails.companyName ?? ""),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonText(
                            label:
                                widget.isUserDetails ? 'Email ID ' : 'Mob. No ',
                            icon:
                                widget.isUserDetails ? "email.png" : "call.png",
                            labelValue: widget.isUserDetails
                                ? (widget.userDetails.email ?? "")
                                : (widget.companyDetails.mobileNumber ?? ""),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonText(
                            label:
                                widget.isUserDetails ? 'Mob. No ' : 'GST/VAT',
                            icon: widget.isUserDetails ? "call.png" : "gst.png",
                            labelValue: widget.isUserDetails
                                ? (widget.userDetails.mobileNumber ?? "")
                                : (widget.companyDetails.gstNum.toString() ??
                                    ""),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonText(
                            label:
                                widget.isUserDetails ? 'Language ' : 'Address',
                            icon: widget.isUserDetails
                                ? "english.png"
                                : "address.png",
                            labelValue: widget.isUserDetails
                                ? (widget.userDetails.name ?? "")
                                : (widget.companyDetails.address ?? ""),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Visibility(
                              visible: widget.isUserDetails,
                              child: CommonText(
                                label: 'Currency ',
                                icon: "coins.png",
                                labelValue: widget.userDetails.currency ?? "",
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: containerDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0, top: 18.0),
                          child: Text(
                            'Credit Limit',
                            style: const TextStyle(
                                color: Color(0xff6B7280),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total unpaid booking',
                                style: TextStyle(
                                    color: Color(0xff6B7280), fontSize: 14.0),
                              ),
                              Text(
                                "USD ${widget.isUserDetails ? (widget.userDetails.totalUnpaidBooking ?? "") : (widget.companyDetails.totalUnpaidBooking ?? "")}",
                                style: const TextStyle(
                                    color: Color(0xff191919),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Available credit limit',
                                style: TextStyle(
                                    color: Color(0xff6B7280), fontSize: 14.0),
                              ),
                              Text(
                                "USD ${widget.isUserDetails ? (widget.userDetails.availableLimit ?? "") : (widget.companyDetails.availableCreditLimit ?? "")}",
                                style: const TextStyle(
                                    color: Color(0xff191919),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration containerDecoration = BoxDecoration(
    /* gradient:  LinearGradient(
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
         colors:  [
           Colors.grey.withOpacity(0.2),
           //ColorClass.greyGradColor.withOpacity(0.2),
           Colors.white,

           //AppColors.colorPrimaryText2,
           const Color(0xffB7B7B7 ).withOpacity(0.2),]),*/
    color: Colors.white,
    border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
    borderRadius: const BorderRadius.all(Radius.circular(10)));

class CommonText extends StatelessWidget {
  final String? label;
  final String? labelValue;
  final String? icon;
  late Function()? onClicked;

  CommonText(
      {this.label, this.onClicked, this.icon, this.labelValue, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,

      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/icons/${icon}",
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  label ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Color(0xff6B7280),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 1,
            child: Text(
              ":",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Color(0xff6B7280),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              labelValue ?? "",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Color(0xff3A434C),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
