import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter/viewmodel/timer_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

// class TimerSeconds extends StatefulWidget {
//
//   @override
//   _TimerSecondsState createState() => _TimerSecondsState();
// }
//
// class _TimerSecondsState extends State<TimerSeconds> {
//
//   final database = FirebaseDatabase.instance;
//
//   @override
//   void initState() {
//
//     Timer.periodic(Duration(seconds: 1), (timer) {
//
//       var timeviewmodel = Provider.of<TimerViewmodel>(context, listen: false);
//       timeviewmodel.updateremaingtime();
//
//     });
//
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ref = database.reference();
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//
//         ElevatedButton(onPressed: () => {
//
//           ref.child("user").set("swaran")
//         },
//             child: Text("submit")
//         ),
//
//         ElevatedButton(onPressed: () => {
//
//           createLink()
//
//         },
//             child: Text("Create link")
//         ),
//
//         ElevatedButton(onPressed: () => {
//
//         },
//             child: Text("Share link")
//         ),
//       ],
//     );
//     // return Container(
//     //   child: Center(
//     //     child: Consumer<TimerViewmodel>(
//     //       builder: (context, data, child){
//     //         return Text(
//     //             data.getremainingtime().toString()
//     //         );
//     //
//     // },
//     //     ),
//     //   ),
//     // );
//   }
//
//   createLink() async {
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://newflutter.page.link/',
//       link: Uri.parse('https://gobumpr.com/'),
//       androidParameters: AndroidParameters(
//         packageName: 'com.example.new_flutter',
//         minimumVersion: 125,
//       ),
//       iosParameters: IosParameters(
//         bundleId: 'com.example.newFlutter',
//         minimumVersion: '1.0.1',
//         appStoreId: '123456789',
//       ),
//       dynamicLinkParametersOptions: DynamicLinkParametersOptions(
//         shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
//       ),
//       // googleAnalyticsParameters: GoogleAnalyticsParameters(
//       //   campaign: 'example-promo',
//       //   medium: 'social',
//       //   source: 'orkut',
//       // ),
//       // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
//       //   providerToken: '123456',
//       //   campaignToken: 'example-promo',
//       // ),
//       socialMetaTagParameters:  SocialMetaTagParameters(
//         title: 'Example of a Dynamic Link',
//         description: 'This link works whether app is installed or not!',
//       ),
//     );
//
//     // final Uri dynamicUrl = await parameters.buildUrl();
//
//     // print(dynamicUrl.toString());
//
//     final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
//     final Uri shortUrl = shortDynamicLink.shortUrl;
//
//     print(shortUrl.toString());
//   }
// }

class Link extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  String? _linkMessage;
  bool _isCreatingLink = false;
  String _testString =
      'To test: long press link and then copy and click from a non-browser '
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      'is properly setup. Look at firebase_dynamic_links/README.md for more '
      'details.';
  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        // ignore: unawaited_futures
        Navigator.pushNamed(context, deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // ignore: unawaited_futures
      // Navigator.pushNamed(context, deepLink.path);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(deepLink.path.toString())));
    }
  }

  Future<void> _createDynamicLink(bool short, String refCode) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://newflutter.page.link',
      link: Uri.parse('https://gobumpr.com/$refCode'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.new_flutter',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.newFlutter',
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Dynamic Link Title',
        imageUrl: Uri.parse(
            "https://d1qb2nb5cznatu.cloudfront.net/startups/i/865292-338c986a9845865043e2f05c56de3c59-medium_jpg.jpg?buster=1445611976"),
        description: 'This is the description of the Dynamic Link',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0),
          title: const Text('Dynamic Links'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your referal code'),
                    controller: myController,
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      !_isCreatingLink ? () => _createDynamicLink(false , myController.text) : null,
                  child: const Text('Get Long Link'),
                ),
                ElevatedButton(
                  onPressed:
                      !_isCreatingLink ? () => _createDynamicLink(true , myController.text) : null,
                  child: const Text('Get Short Link'),
                ),
                ElevatedButton(
                  onPressed: () => {Share.share(_linkMessage!)},
                  child: const Text('Share Short Link'),
                ),
                InkWell(
                  onTap: () async {
                    if (_linkMessage != null) {
                      // print(_linkMessage);
                    }
                  },
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: _linkMessage));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied Link!')),
                    );
                  },
                  child: Text(
                    _linkMessage ?? '',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                Text(_linkMessage == null ? '' : _testString)
              ],
            ),
          );
        }),
      ),
    );
  }
}
