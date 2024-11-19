
import 'dart:io';

import 'package:dio/src/form_data.dart';
import 'package:projects/src/core/apiHelper/api_client.dart';
import 'package:projects/src/core/apiHelper/common/Resource.dart';
import 'package:projects/src/core/apiHelper/common/Status.dart';
import 'package:projects/src/core/apiHelper/common/api_endpoint.dart';
import 'package:projects/src/core/services/shared_pref/shared_pref.dart';
import 'package:projects/src/core/utils/locator.dart';
import 'package:projects/src/feature/home/data/userProfile/user_profile_use_case.dart';



class UserProfileUseCaseImpl extends UserProfileUseCase{
  final ApiClient _apiClient = getIt<ApiClient>();
  final SharedPref _pref = getIt<SharedPref>();




  @override
  Future<Resource> getUserProfileData({required Map<String, dynamic> requestData}) async {
    Map<String, String> header = {
    };
    Resource resource =
    await _apiClient.getRequest(url:APIEndPoint.userListAPIEndPoint,header: header, requestData:requestData );
    if (resource.status == STATUS.SUCCESS) {
      return resource;

    } else {
      return resource;
    }

  }

  @override
  Future<Resource> getCompanyProfileData({required Map<String, dynamic> requestData}) async {
    Map<String, String> header = {
    };
    Resource resource =
    await _apiClient.getRequest(url:APIEndPoint.companyListAPIEndPoint,header: header, requestData:requestData );
    if (resource.status == STATUS.SUCCESS) {
      return resource;

    } else {
      return resource;
    }

  }










}

