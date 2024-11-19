

class APIEndPoint{
  static final APIEndPoint _instance = APIEndPoint._internal();

  factory APIEndPoint() {
    return _instance;
  }

  APIEndPoint._internal();



  static const BaseUrl = "https://673736a9aafa2ef222330e54.mockapi.io/" ;

  static const userListAPIEndPoint =  "${BaseUrl}users"; // client map key
  static const companyListAPIEndPoint =  "${BaseUrl}company"; // client map key







}