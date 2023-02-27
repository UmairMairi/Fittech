import 'package:url_launcher/url_launcher.dart';

extension StringExtensions on String {
  openAsLink() async {
    if (await canLaunchUrl(Uri.parse(this))) {
      await launchUrl(
        Uri.parse(this
        ),
        mode: LaunchMode.platformDefault
      );
    } else {
      throw 'There was a problem to open the url: $this';
    }
  }
}
