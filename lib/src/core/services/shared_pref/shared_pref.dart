import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  SharedPref();

  void setLoginStatus(bool status);
  Future<bool> getLoginStatus();

  void setUserId(int rollId);
  Future<int> getUserId();

  void setFirebaseToken(String status);
  Future<String> getFirebaseToken();
  void setUserAuthToken(String authToken);
  Future<String> getUserAuthToken();

  void setDeviceIMEINo(String token);
  Future<String> getDeviceIMEINo();



  void setPhoneCode(String data);

  Future<String> getPhoneCode();

  void setAge(String data);

  Future<String> getAge();

  void setName(String data);
  Future<String> getName();

  void setEmail(String data);
  Future<String> getEmail();


  void setPhone(String data);
  Future<String> getPhone();

  void setProfileImage(String data);
  Future<String?> getProfileImage();

  void clearOnLogout();
}
