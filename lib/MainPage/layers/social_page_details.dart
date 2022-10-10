import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

class SocialPageDetails extends StatefulWidget {
  const SocialPageDetails(this.page_vid, {super.key});

  final String? page_vid;

  @override
  _SocialPageDetailsState createState() => _SocialPageDetailsState(page_vid);
}

class commentBlock {
  late String UserName;
  late String Messgae;

  commentBlock(this.UserName, this.Messgae);
}

class _SocialPageDetailsState extends State<SocialPageDetails> {
  final String? page_vid;
  static String page_text = "";
  static String page_title = "";
  static String page_user_name = "";

  static String pre_page_title = "hehehehehhehehehehehhehehehhehhehe";

  late List<commentBlock> page_comments;

  final TextEditingController _controller = TextEditingController();

  _SocialPageDetailsState(this.page_vid) {
  }

  List<Widget> _buildCommentList() {
    List<Widget> tmp = [];
    return tmp;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // init all data. The internet post and get is from here.
    // init the main page data.
    // init the comments data.
    super.initState();
  }

  Future<Map<String, dynamic>> _getPageData() async {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url =
        'https://ketnekonas.hopto.org:21669/text/?VID=${page_vid}'; //${page_vid}
    print(url);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(reply);
    client.badCertificateCallback = null;
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    _getPageData().then((value) => {
      page_text = value['Text'][0].toString(),
      page_user_name = value['Username'][0].toString(),
      page_title = value['Title'][0].toString(),
      if (page_title != pre_page_title) {
        this.setState(() {
          pre_page_title = page_title;
        })
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black38,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: const Color(0xfffcfcff),
        title: Text(
          page_user_name,
          style: const TextStyle(color: Colors.teal),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                page_title,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: MarkdownParse(
                  data: page_text,
                ),
              )
            ] + _buildCommentList(),
          ),
        ),
      ),
    );
  }
}
