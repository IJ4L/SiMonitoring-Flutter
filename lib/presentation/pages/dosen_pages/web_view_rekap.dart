import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simor/cubit/get_rekap/get_rekap_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReakapitulasiPage extends StatefulWidget {
  const ReakapitulasiPage({super.key, required this.lokasi});

  final String lokasi;

  @override
  State<ReakapitulasiPage> createState() => _ReakapitulasiPageState();
}

class _ReakapitulasiPageState extends State<ReakapitulasiPage> {
  @override
  void initState() {
    context.read<GetRekapCubit>().getRekap(widget.lokasi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadHtmlString("<html><body><h1>Hello, HTML!</h1></body></html>");

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetRekapCubit, GetRekapState>(
          builder: (context, state) {
            if (state is GetRekapLoaded) {
              controller.loadHtmlString(state.url);
              return WebViewWidget(controller: controller);
            }
            return WebViewWidget(controller: controller);
          },
        ),
      ),
    );
  }
}
