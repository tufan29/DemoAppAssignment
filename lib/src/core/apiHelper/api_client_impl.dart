import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projects/src/core/apiHelper/api_client.dart';
import 'package:projects/src/core/apiHelper/common/Resource.dart';
import 'package:projects/src/core/apiHelper/common/locator.dart';
import 'package:projects/src/core/apiHelper/common/network_client.dart';
import 'package:projects/src/core/utils/common_utils.dart';
import 'package:projects/src/core/utils/helper/app_strings.dart';



import 'common/Status.dart';

class ApiClientImpl extends ApiClient {
  final NetworkClient _networkClient = getIt<NetworkClient>();
  @override
  String handleDioError(DioException e) {
    var msg = "";
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          msg = AppStrings.CHECK_INTERNET;
        } else {
          msg = AppStrings.SOMETHING_WENT_WRONG;
        }
        break;
      default:
        msg = AppStrings.SOMETHING_WENT_WRONG;
        break;
    }
    return msg;
  }

  @override
  Future<Resource> getRequest(
      {required String url,
      Map<String, dynamic>? requestData,
      Map<String, String>? header}) async {
    try {
      CommonUtils().loadingState(isLoading: false);

      var response = await Dio().get(url,
          queryParameters: requestData, options: Options(headers: header));
      CommonUtils().loadingState(isLoading: false);

      return Resource(
          status: response.statusCode == 200 ? STATUS.SUCCESS : STATUS.ERROR,
          data: response.data,
          message: "User Data Fetch successfully");
    } on DioException catch (e) {
      CommonUtils().loadingState(isLoading: false);

      if (e.response != null && e.response!.data != null) {
        Map<String,dynamic> responses = e.response?.data ?? {};
        return Resource(status: STATUS.ERROR, message: responses['message'] ?? _networkClient.getHttpErrorMessage(statusCode: e.response!.statusCode!));
      } else {
        return Resource(
            status: STATUS.ERROR, message: AppStrings.SOMETHING_WENT_WRONG);
      }
    }
  }

  @override
  Future<Resource> postRequest(
      {required String url,
      required Map<String, dynamic> requestData,
      Map<String, String>? header}) async {
    try {
      CommonUtils().loadingState(isLoading: false);

      var response = await Dio()
          .post(url, data: jsonEncode(requestData), options: Options(headers: header));
      CommonUtils().loadingState(isLoading: false);

      return Resource(
          status: response.data['status'] ? STATUS.SUCCESS : STATUS.ERROR,
          data: response.data['data'],
          message: response.data['message']);
    } on DioException catch (e) {
      CommonUtils().loadingState(isLoading: false);
      if (e.response != null) {
        Map<String,dynamic> responses = e.response?.data ?? {};
        return Resource(status: STATUS.ERROR, message: responses['message'] ?? _networkClient.getHttpErrorMessage(statusCode: e.response!.statusCode!));
      } else {
        return Resource(
            status: STATUS.ERROR, message: AppStrings.SOMETHING_WENT_WRONG);
      }
    }
  }

  @override
  Future<Resource> postRequestMultiData({required String url, required FormData requestData, Map<String, String>? header}) async {
    try {
      CommonUtils().loadingState(isLoading: false);

      var response = await Dio()
          .post(url, data: requestData, options: Options(headers: header));
      CommonUtils().loadingState(isLoading: false);
      ///////////////////////////////////////
      print("******************************** Request *******************") ;
      print(requestData.toString());
      print("******************************** Response *******************") ;
      print( Resource(
          status: response.data['status'] ? STATUS.SUCCESS : STATUS.ERROR,
          data: response.data['data'],
          message: response.data['message']).toString());
      print("******************************** End *******************") ;
      ///////////////////////////////////
      return Resource(
          status: response.data['status'] ? STATUS.SUCCESS : STATUS.ERROR,
          data: response.data['data'],
          message: response.data['message']);
    } on DioException catch (e) {
      CommonUtils().loadingState(isLoading: false);
      if (e.response != null) {
        print("******************************** Request *******************") ;
        print(requestData.toString());
        print("******************************** Response *******************") ;

        print("******************************** End *******************") ;
        if(e.response?.statusMessage != null){
          Map<String,dynamic> responses = e.response?.data ?? {};
          return Resource(status: STATUS.ERROR, message: responses['message'] ?? _networkClient.getHttpErrorMessage(statusCode: e.response!.statusCode!));

        } else{
          return Resource(
              status: STATUS.ERROR, message: AppStrings.SOMETHING_WENT_WRONG);

        }
        } else {
        return Resource(
            status: STATUS.ERROR, message: AppStrings.SOMETHING_WENT_WRONG);
      }
    }
  }

  @override
  Future<Resource> deleteRequest({required String url, Map<String, dynamic>? requestData, Map<String, String>? header}) async {
    try {
      CommonUtils().loadingState(isLoading: true);
      var response = await Dio().delete(
        url,
        data: requestData,
        options: Options(headers: header),
      );

      CommonUtils().loadingState(isLoading: false);

      return Resource(
        status: response.data['status'] ? STATUS.SUCCESS : STATUS.ERROR,
        data: response.data['data'],
        message: response.data['message'],
      );
    } on DioException catch (e) {
      CommonUtils().loadingState(isLoading: false);

      if (e.response != null) {
        Map<String, dynamic> responseData = e.response?.data ?? {};
        return Resource(
          status: STATUS.ERROR,
          message: responseData['message'] ??
              _networkClient.getHttpErrorMessage(
                  statusCode: e.response!.statusCode!),
        );
      } else {
        return Resource(
          status: STATUS.ERROR,
          message: AppStrings.SOMETHING_WENT_WRONG,
        );
      }
    }
  }

}
