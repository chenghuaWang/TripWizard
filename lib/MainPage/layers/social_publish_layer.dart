import 'package:flutter/material.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';
import 'package:trip_wizard/GlobalState/primitive.dart';

import 'dart:convert';
import 'dart:io';

class SocialPublishPage extends StatefulWidget {
  const SocialPublishPage({super.key});

  @override
  _SocialPublishPageState createState() => _SocialPublishPageState();
}

class _SocialPublishPageState extends State<SocialPublishPage> {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _title_ctrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.black38,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: const Color(0xfffcfcff),
        title: const Text(
          "Markdown Editor",
          style: TextStyle(
            color: Colors.teal
          ),
        ),
        actions: [
          GestureDetector(
            onTap: ()=>{
              _pushMarkdown(),
            },
            child: Row(
              children: const [
                Icon(Icons.arrow_circle_up, color: Colors.grey,),
                Text("发布", style: TextStyle(color: Colors.grey),),
                SizedBox(width: 20,),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _title_ctrl,
                  decoration: const InputDecoration(
                      hintText: "输入标题",
                      focusColor: Colors.teal,
                      hoverColor: Colors.teal,
                      fillColor: Colors.teal
                  ),
                ),
              ),
              Expanded(
                child: MarkdownFormField(
                  controller: _controller,
                  enableToolBar: true,
                  emojiConvert: true,
                  autoCloseAfterSelectEmoji: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _publishButtonAction() {

  }

  Future<void> _pushMarkdown() async {
    String src_mk = _controller.text;

    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    String url ='https://ketnekonas.hopto.org:21669/text/add/';

    Map map = {
      "Username": PRIMITIVES.m_userName,
      "Text": src_mk,
      "Title": _title_ctrl.text,
      "Abstract": "No"
    };

    HttpClientRequest request = await client.postUrl(Uri.parse(url));

    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    print(reply);

    client.badCertificateCallback = null;

    Navigator.of(context).pop();
  }
}