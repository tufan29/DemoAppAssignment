enum DeviceTypes {
  android,
  iOs,
  web;
}
//1 Facebook 2 Google 3 twitter 0
enum RollIds {
  Facebook(1),
  Google(2),
  twitter(3),
  other(0);

  const RollIds(this.type);

  final int type;
}
enum UserjourneyTypes {
  signUpOtpVerificationNotDone(0),
  signUpOtpVerificationDone(1),
  SubmitAboutInfoDone(2),
  SubmitInterestsDone(3);
  const UserjourneyTypes(this.type);

  final int type;
}



/*enum GenderType {
  Male(1),
  Female(2),
  Others(0);

  const GenderType(this.type);

   final int type;
}*/

