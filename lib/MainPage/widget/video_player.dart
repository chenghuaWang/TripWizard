import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class VideoPlayer4BiliBili extends StatelessWidget {

  late String src_url;

  VideoPlayer4BiliBili(this.src_url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: src_url,
    );
  }
}
