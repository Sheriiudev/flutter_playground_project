import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class MyWebViewWidget extends StatefulWidget {
  const MyWebViewWidget({super.key});

  @override
  State<StatefulWidget> createState() => MyWebViewState();
}

class MyWebViewState extends State<MyWebViewWidget> {
  var isLoading = false;
  final key = UniqueKey();
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {
        debugPrint('WebView is loading (progress : $progress%)');
      },
      onPageStarted: (String url) {
        setState(() {
          isLoading = true;
        });
        debugPrint('WebView Page started loading: $url');
      },
      onPageFinished: (String url) {
        setState(() {
          isLoading = false;
        });
        debugPrint('WebView Page finished loading: $url');
      },
      onWebResourceError: (WebResourceError error) {
        debugPrint('''
WebView Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
      },
    ));
    controller.loadRequest(Uri.parse("https://absoluit.com"));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Expanded(child: SafeArea(child: WebViewWidget(controller: controller))),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.orange,
              ))
            : const SizedBox(),
      ],
    ));
  }
}
