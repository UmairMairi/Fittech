import 'package:fit_tech/data/models/TermsCondtions.dart';
import 'package:fit_tech/data/repositories/policies/policies_repository.dart';
import 'package:flutter/material.dart';

import '../data/models/DataPolicy.dart';
import '../data/models/faqData/FaqCategories.dart';
import '../data/models/faqData/FaqQuestions.dart';
import '../data/repositories/faq_repository/faq_repository.dart';
import '../utils/my_utils.dart';

class FaqProvider extends ChangeNotifier {
  FaqCategories? faqCategoriesModel;
  FaqQuestions? faqQuestionsModel;
  var faqCategoriesLoading = false;
  var faqQuestionsLoading = false;

  Future<dynamic> getFaqCategories({required BuildContext context}) async {
    faqCategoriesLoading = true;
    notifyListeners();
    try {
      var response = await FaqRepository.getFaqCategories();
      if (response is Map) {
        faqCategoriesLoading = false;
        notifyListeners();
        MyUtils.showMessage(
            context: context, msg: response['message'], success: false);
        return null;
      } else {
        faqCategoriesModel = response;
        faqCategoriesLoading = false;
        notifyListeners();
        return faqCategoriesModel;
      }
    } catch (e) {
      faqCategoriesLoading = false;
      MyUtils.showMessage(context: context, msg: e.toString(), success: false);
      faqCategoriesModel = null;
      notifyListeners();
      return null;
    }
  }

  Future<dynamic> getFaqQuestions({required BuildContext context,required String id}) async {
    faqQuestionsLoading = true;
    notifyListeners();
    try {
      var response = await FaqRepository.getFaqQuestions(id: id);
      if (response is Map) {
        faqQuestionsLoading = false;
        notifyListeners();
        MyUtils.showMessage(
            context: context, msg: response['message'], success: false);
        return null;
      } else {
        faqQuestionsModel = response;
        faqQuestionsLoading = false;
        notifyListeners();
        return faqQuestionsModel;
      }
    } catch (e) {
      faqQuestionsLoading = false;
      MyUtils.showMessage(context: context, msg: e.toString(), success: false);
      faqQuestionsModel = null;
      notifyListeners();
      return null;
    }
  }
}
