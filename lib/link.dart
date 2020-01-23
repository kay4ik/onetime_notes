import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Uri initialLink;

final androidParams = AndroidParameters(
  packageName: "de.thezoey.onetime_notes",
  minimumVersion: 25,
  fallbackUrl: Uri.parse("https://google.com")
);

final iosParams = IosParameters(
  bundleId: "de.thezoey.onetimeNotes",
);

final socialMetaParams = SocialMetaTagParameters(
  imageUrl: Uri.parse("https://firebasestorage.googleapis.com/v0/b/onetime-notes.appspot.com/o/lock-min.jpg?alt=media&token=802c4713-7bfd-456b-8a14-d59314a2cbd3"),
  title: "Onetime Notes",
  description: "Self-Destructing Messages",
);

final uriPrefix = "https://otn.thezoey.de";

final parameters = DynamicLinkParameters(
  link: Uri.parse("https://otn.thezoey.de/"),
  uriPrefix: "https://otn.thezoey.de",
  androidParameters: AndroidParameters(
    packageName: "de.thezoey.onetime_notes",
    minimumVersion: 25,
  ),
  iosParameters: IosParameters(
    bundleId: "de.thezoey.onetimeNotes",
  ),
);

Future<Uri> retrieveDynamicLink() async {
  final PendingDynamicLinkData data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  initialLink = data?.link;
  return data?.link;
}
