import 'package:fit_tech/logic/policies_provider.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/presentation/widgets/shimmer.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String tag = "privacy_policy_screen";

  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
              child: Builder(builder: (context) {
                var provider = context.watch<PoliciesProvider>();
                if (provider.policyLoading) {
                  return Shimmer.fromColors(
                      highlightColor: MyColors.shimmerHighlightColor,
                      baseColor: MyColors.shimmerBaseColor2,
                      child: const Text(
                        Constants.dummyText,
                        style: TextStyle(height: 1.5,backgroundColor: MyColors.whiteColor,),
                      )
                  );
                }
                return Html(
                  data: provider.dataPolicyModel?.data?.description ?? "",
                  tagsList: Html.tags..addAll(["bird", "flutter"]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PoliciesProvider>().getPolicyData(context: context);
  }

}
