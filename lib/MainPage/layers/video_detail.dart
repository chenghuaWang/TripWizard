import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';
import 'package:trip_wizard/MainPage/utils/video_data_crap.dart';

// The video problem occurs here
// https://github.com/flutter/flutter/issues/71822

import 'dart:io';
import 'dart:convert';

// Widget. Video Player
import 'package:trip_wizard/MainPage/widget/video_player.dart';
import 'package:comment_box/comment/comment.dart';

class VideoDetails extends StatefulWidget {
  late VideoDataPayload data;
  VideoDetails(this.data);

  @override
  _VideoDetailsState createState() => _VideoDetailsState(data);
}

class CommentData {
  String UserName = "";
  String Message = "";
  String Oid = "";

  CommentData(this.UserName, this.Oid, this.Message);
}

class _VideoDetailsState extends State<VideoDetails> {
  VideoDataPayload data;

  _VideoDetailsState(this.data) {
    for (int i = 0; i < 10; ++i) {
      _getCommentData().then((value) => {
        tmp_data.add(CommentData(
          value['from_user'].toString(),
          value['oid'].toString(),
          value['data'].toString(),
        ))
      });
    }
  }

  late VideoPlayer4BiliBili player = VideoPlayer4BiliBili(data.videoStreamUrl);

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  List<CommentData> tmp_data = [];

  Future<Map<String, dynamic>> _getCommentData() async {
    List<CommentData> tmp = [];
    HttpClient client = HttpClient();
    String url = 'https://api.mcloc.cn/words?type=json';
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(reply);
    return jsonData;
  }

  Widget _buildReplies(List<CommentData> data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const CircleAvatar(radius: 50),
                ),
              ),
              title: Text(
                tmp_data[i].UserName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(tmp_data[i].Message),
            ),
          )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightTheme.backgroundColor,
        leading: Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: IconButton(
              onPressed: () => {Navigator.of(context).pop()},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black38,
              ),
            )),
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
              alignment: Alignment.center,
              child: Text(
                data.city,
                style: const TextStyle(
                  color: Colors.teal,
                  fontFamily: 'WorkSansBold',
                  fontSize: 16,
                ),
              )),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PopupMenuButton<String>(
                  color: Constants.lightTheme.backgroundColor,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.teal,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          value: 'Judge',
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.thumb_down,
                                color: Colors.teal,
                                size: 16,
                              ),
                              Text(
                                '举报',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ]))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: [
            player,
            // VideoPlayer4BiliBili(data.videoStreamUrl),
            Column(
              crossAxisAlignment:  CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 2,
                      left: 12,
                      right: 12,
                      bottom: 0
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                        color: Color(0xfffcfcff),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(data.upAvatarUrl),
                          radius: 36,
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          child: Column(
                            children: [
                              Text(data.upName, style: const TextStyle(color: Colors.black, fontSize: 16),),
                              const SizedBox(height: 12,),
                              Text(data.upNumber, style: const TextStyle(color: Colors.grey, fontSize: 14),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: CommentBox(
                userImage:
                "https://th.bing.com/th/id/OIP.aZ8yyQdUC0LzO93GGATwvAAAAA?pid=ImgDet&rs=1",
                labelText: 'Write a comment...',
                withBorder: false,
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      CommentData value = CommentData(
                          "User Name",
                          "User Oid",
                          commentController.text
                      );
                      tmp_data.insert(0, value);
                    });
                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: const Color(0xfffcfcff),
                textColor: Colors.black,
                sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.teal),
                child: _buildReplies(tmp_data)
              ),
            ),
          ],
        ),
      )
    );
  }
}
