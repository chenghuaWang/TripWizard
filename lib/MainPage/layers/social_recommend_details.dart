import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:trip_wizard/MainPage/layers/social_page_details.dart';

import 'dart:async';

class SocialRecommendDetails extends StatefulWidget {
  const SocialRecommendDetails({super.key});

  @override
  _SocialRecommendDetailsState createState() => _SocialRecommendDetailsState();
}

class _SocialRecommendDetailsState extends State<SocialRecommendDetails> {
  static List<Widget> ArticleItems = [];
  static int flush_cnt = 0;

  static bool first_time = true;

  Future<Map<String, dynamic>> _getComments10() async {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = 'https://ketnekonas.hopto.org:21669/text/random';
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(reply);
    client.badCertificateCallback = null;
    return jsonData;
  }

  List<Widget> _buildAllItem() {
    // Get data from Sun's ap.
    _getComments10().then((value) => {
          for (int i = 0; i < 10; ++i)
            {
              ArticleItems.insert(
                  0,
                  GFListTile(
                    avatar: const GFAvatar(
                      backgroundImage: AssetImage('assets/images/John.png'),
                    ),
                    titleText: value['Title'][i].toString(),
                    icon: const Icon(Icons.favorite),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SocialPageDetails(value['VID'][i].toString()
                              )
                      )
                      )
                    },
                  )
              )
            },
            if (first_time) {
              this.setState(() {
                first_time = false;
              })
            }
        });
    flush_cnt += 1;
    if (flush_cnt > 5) {
      flush_cnt = 0;
      // ArticleItems.removeRange(10, 50);
    }
    return ArticleItems;
  }

  @override
  Widget build(BuildContext contex) {
    print(ArticleItems.length);
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => {
                    _buildAllItem(),
                    this.setState(() {
                    })
                  },
                  icon: const Icon(Icons.update, color: Colors.teal,))
            ],
          )
        ] + _buildAllItem(),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
