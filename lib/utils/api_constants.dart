class ApiConstants {
  static const String baseUrl = "http://159.203.83.246/api";
  static const String createAccount = "$baseUrl/account/register/";
  static const String verifyAccount = "$baseUrl/account/emailverify/";
  static const String loginAccount = "$baseUrl/account/login/";
  static const String recoverPassword = "$baseUrl/account/resendemail/";
  static const String forgotPasswordVerifiedCode = "$baseUrl/account/forgetpasswordverifycode/";
  static const String setNewPassword = "$baseUrl/account/setnewpassword/";
  static const String updateProfile = "$baseUrl/account/updateprofile/";
  static const String deleteAccount ="${baseUrl}account/deleteaccount/";
  static const String changeImageProfile="$baseUrl/account/changeprofileimage/";
  static const String changeProfileImage="$baseUrl/account/changeprofileimage/";

  static const String verifyIdentity="$baseUrl/account/verifyyouridentity/";
  static const String changePasswordAfterLogin="$baseUrl/account/changepassword/";

  static const String getTermsConditions="$baseUrl/account/termsandcondition";
  static const String getPolicyData="$baseUrl/account/datapolicy";
}
