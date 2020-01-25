import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:onetime_notes/models/note.dart';

export 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Linker {
  static final instance = Linker._();
  Linker._();

  Uri initialLink;
  final LinkParameters params = LinkParameters();

  Future<Uri> retrieveDynamicLink() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    initialLink = data?.link;
    return data?.link;
  }

  Future<Uri> buildDynamicLink(Note note) async {
    final parameter = DynamicLinkParameters(
      androidParameters: params.androidParams,
      iosParameters: params.iosParams,
      socialMetaTagParameters: params.socialMetaParams,
      uriPrefix: params.uriPrefix,
      link: Uri.parse("https://otn.thezoey.de/note?id=" + note.id),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
    );
    final link = await parameter.buildShortLink();
    return link.shortUrl;
  }
}

class LinkParameters {
  final uriPrefix = "https://otn.thezoey.de";
  final androidParams = AndroidParameters(
      packageName: "de.thezoey.onetime_notes",
      fallbackUrl: Uri.parse("https://google.com"));

  final iosParams = IosParameters(
    bundleId: "de.thezoey.onetimeNotes",
  );

  final socialMetaParams = SocialMetaTagParameters(
    imageUrl: Uri.parse(
        "https://firebasestorage.googleapis.com/v0/b/onetime-notes.appspot.com/o/lock-min.jpg?alt=media&token=802c4713-7bfd-456b-8a14-d59314a2cbd3"),
    title: "Onetime Notes",
    description: "Self-Destructing Messages",
  );


  DynamicLinkParameters get parameters => DynamicLinkParameters(
    link: Uri.parse("https://otn.thezoey.de/"),
    uriPrefix: uriPrefix,
    androidParameters: androidParams,
    iosParameters: iosParams,
  );
}
