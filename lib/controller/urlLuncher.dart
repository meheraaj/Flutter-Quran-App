import 'package:url_launcher/url_launcher.dart';

void lucnUrl(url) async {
  await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
      : print('cant open this url');
}
