import 'package:dio/dio.dart';
import 'package:projects/src/core/apiHelper/common/Resource.dart';



abstract class UserProfileUseCase{

  Future<Resource> getUserProfileData({required Map<String, dynamic> requestData});
  Future<Resource> getCompanyProfileData({required Map<String, dynamic> requestData});




}