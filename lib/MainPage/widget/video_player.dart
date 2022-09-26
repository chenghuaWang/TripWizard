import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';

class VideoPlayer4BiliBili extends StatelessWidget {

  late String src_url;

  VideoPlayer4BiliBili(this.src_url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: src_url,
      style: {
        "iframe": Style(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.width / 16.0) * 9.0,
        ),
      },
      customRenders: {
        iframeMatcher(): iframeRender(),
      },
    );
  }
}
