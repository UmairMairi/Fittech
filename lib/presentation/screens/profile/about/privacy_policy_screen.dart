import 'package:fit_tech/logic/policies_provider.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String tag = "privacy_policy_screen";

  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PoliciesProvider policiesProvider = PoliciesProvider();
  String description = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(
              title: Constants.privacyPolicyScreenTitle,
            ),
            Expanded(
              child: Html(
                data: description,
                tagsList: Html.tags..addAll(["bird", "flutter"]),
              ),
            ),
          ],
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
    var model = await policiesProvider.getPolicyData(context: context);
    if (model != null) {
      setState(() {
        description = policiesProvider.dataPolicyModel?.data?.description ?? "";
      });
    }
  }
}
