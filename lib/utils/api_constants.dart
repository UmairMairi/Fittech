class ApiConstants {
  static const String baseUrl = "http://159.203.83.246/api";

  static const String createAccount = "$baseUrl/account/register/";
  static const String verifyAccount = "$baseUrl/account/emailverify/";
  static const String loginAccount = "$baseUrl/account/login/";
  static const String recoverPassword = "$baseUrl/account/resendemail/";
  static const String forgotPasswordVerifiedCode = "$baseUrl/account/forgetpasswordverifycode/";
  static const String setNewPassword = "$baseUrl/account/setnewpassword/";
  static const String updateProfile = "$baseUrl/account/updateprofile/";
  static const String deleteAccount ="$baseUrl/account/deleteaccount/";
  static const String changeImageProfile="$baseUrl/account/changeprofileimage/";

  static const String verifyIdentity="$baseUrl/account/verifyyouridentity/";
  static const String changePasswordAfterLogin="$baseUrl/account/changepassword/";

  static const String getTermsConditions="$baseUrl/account/termsandcondition";
  static const String getPolicyData="$baseUrl/account/datapolicy";

  static const String getFaqCategories="$baseUrl/account/faqcategories/";
  static const String getFaqQuestions="$baseUrl/account/faqquestions/";

  static const String logoutUser="$baseUrl/account/logout/";
  static const String sendCode="$baseUrl/account/sendverificationcode/";

  static const String getFood="$baseUrl/account/foods/";
  static const String addNutrition="$baseUrl/account/usernutritioninfodata/";

  static const String getRecipeList="$baseUrl/recipie/get-user-all-recipie";
  static const String addRecipe="$baseUrl/recipie/add-recipie";
  static const String editRecipe="$baseUrl/recipie/edit-recipie";

}
