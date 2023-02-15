import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/logic/delete_account_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/shared_prefences_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  static const String tag = "delete_account_screen";

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  color: MyColors.whiteColor,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: MyColors.blackColor,
                                size: 24.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const Expanded(
                              child: Text(
                                Constants.deleteAccountTitle,
                                textAlign: TextAlign.center,
                                style: MyTextStyle.heading3,
                              ),
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: MyColors.blackColor,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20.0),
                        child: const Text(
                          Constants.deleteAccountInfo,
                          textAlign: TextAlign.start,
                          style: MyTextStyle.paragraph1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Builder(builder: (context) {
                          return PrimaryButton(
                            title: Constants.deleteAccountButtonLabel,
                            backgroundColor: MyColors.whiteColor,
                            textColor: MyColors.blackColor,
                            onPressed: () {
                              context
                                  .read<DeleteAccountProvider>()
                                  .setDeleteAccountResponseInMap(
                                      context: context,
                                      token: GlobalState.token!);
                              showDialogue(
                                  context: context,
                                  category: Profile.deleteAccount);
                            },
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogue({required BuildContext context, required Profile category}) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ProfileDialogue(category: category);
        });
  }
}
