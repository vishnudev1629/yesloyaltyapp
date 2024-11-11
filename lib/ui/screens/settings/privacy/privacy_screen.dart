import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



 
class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // #docregion webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://yesyesloyalty.agatebc.in/privacy-policy'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SafeArea(
        child: Column(
          children: [
                const SizedBox(height: 20),
                  HomeAppBar(
                    onBackTap: () async {
                      Navigator.of(context).pop();
                    },
                    isthereQr: false,
                  ), const SizedBox(height: 20),
            Expanded(
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
