import 'package:fit_tech/logic/policies_provider.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsConditionsScreen extends StatefulWidget {
  static const String tag = "terms_conditions_screen";

  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  PoliciesProvider policiesProvider=PoliciesProvider();
  String description="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(
              title: Constants.termsConditionsScreenTitle,
            ),
            Expanded(
              child:  Html(
                data:  description,
                tagsList: Html.tags..addAll(["bird", "flutter"]),
            ),
            )],
        ),
      ),
    );
  }
@override
  void initState() {
    super.initState();
    getTermsConditions();
  }
  getTermsConditions() async {
    var model =
    await policiesProvider.getTermsConditions(
        context: context);
    if (model != null) {
      setState(() {
        description=policiesProvider.termsConditionModel?.data?.description ?? "";
      });

    }
  }
}
