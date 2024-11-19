import 'package:projects/src/core/services/shared_pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefImpl extends SharedPref {
  final String _loginStatus = "loginStatus";
  final String _userId = "userId";
  final String _firebaseToken = "firebaseToken";
  final String _deviceIMEINo = "deviceImeiNo";

  final String _userAuthToken = "userAuthToken";

  final String _phoneCode = "phoneCode";
  final String _userName = "userName";
  final String _userAge = "userAge";
  final String _phoneNumber = "phoneNumber";
  final String _emailId = "emailId";
  final String _profileImage = "profileImg";

  @override
  Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getBool(_loginStatus) ?? false;
  }

  @override
  Future<int> getUserId() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getInt(_userId) ?? 0;
  }

  @override
  Future<String> getFirebaseToken() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_firebaseToken) ?? "";
  }  @override
  Future<String> getUserAuthToken() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_userAuthToken) ?? "";
  }

  @override
  Future<String> getDeviceIMEINo() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_deviceIMEINo) ?? "";
  }




  @override
  Future<String> getPhoneCode() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_phoneCode) ?? "";
  }

  @override
  Future<String> getAge() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_userAge) ?? "";
  }

  @override
  Future<String> getName() async {
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_userName) ?? "";
  }

  /////////////////////////////////

  @override
  void setLoginStatus(bool status) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setBool(_loginStatus, status);
  }

  @override
  void setUserId(int rollId) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setInt(_userId, rollId);
  }

  @override
  void setFirebaseToken(String token) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_firebaseToken, token);
  }  @override
  void setUserAuthToken(String token) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_userAuthToken, "Bearer "+token);
  }

  @override
  void setDeviceIMEINo(String token) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_deviceIMEINo, token);
  }



  @override
  void setPhoneCode(String data) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_phoneCode, data);
  }

  @override
  void setAge(String data) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_userAge, data);
  }

  @override
  void setName(String data) async {
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_userName, data);
  }

  @override
  void clearOnLogout() async {
    final SharedPreferences prefs = await super.prefs;
    for(String key in prefs.getKeys()) {

        prefs.
        remove(key);
     // }
    }
  }

  @override
  Future<String> getEmail() async{
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_emailId) ?? "";
  }

  @override
  Future<String> getPhone() async{
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_phoneNumber) ?? "";
  }

  @override
  void setEmail(String data) async{
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_emailId, data);
  }

  @override
  void setPhone(String data) async{
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_phoneNumber, data);
  }

  @override
  Future<String?> getProfileImage() async{
    final SharedPreferences prefs = await super.prefs;
    return prefs.getString(_profileImage);
  }

  @override
  void setProfileImage(String data) async{
    final SharedPreferences prefs = await super.prefs;
    prefs.setString(_profileImage, data);
  }
}
