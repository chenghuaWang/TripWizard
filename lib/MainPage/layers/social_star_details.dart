import 'package:flutter/material.dart';
import 'package:trip_wizard/flat_widgets/flat_action_btn.dart';
import 'package:trip_wizard/flat_widgets/flat_add_story_btn.dart';
import 'package:trip_wizard/flat_widgets/flat_chat_item.dart';
import 'package:trip_wizard/flat_widgets/flat_counter.dart';
import 'package:trip_wizard/flat_widgets/flat_page_header.dart';
import 'package:trip_wizard/flat_widgets/flat_page_wrapper.dart';
import 'package:trip_wizard/flat_widgets/flat_profile_image.dart';
import 'package:trip_wizard/flat_widgets/flat_section_header.dart';


class SocialStarDetails extends StatefulWidget {
  const SocialStarDetails({super.key});

  @override
  _SocialStarDetailsState createState() => _SocialStarDetailsState();
}

class _SocialStarDetailsState extends State<SocialStarDetails> {

  @override
  Widget build(BuildContext context) {
    return FlatPageWrapper(
      scrollType: ScrollType.floatingHeader,
      backgroundColor: const Color(0xfffcfcff),
      children: [
        FlatSectionHeader(
          title: "最近提到的",
          textColor: Colors.teal,
        ),
        Container(
          height: 76.0,
          margin: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: FlatAddStoryBtn(),
              ),
              FlatProfileImage(
                imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                onlineIndicator: true,
                outlineIndicator: true,
              ),
              FlatProfileImage(
                outlineIndicator: true,
                onlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
              ),
              FlatProfileImage(
                outlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
              ),
              FlatProfileImage(
                onlineIndicator: true,
                outlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
              ),
              FlatProfileImage(
                outlineIndicator: true,
              ),
              FlatProfileImage(
                outlineIndicator: true,
              ),
              FlatProfileImage(
                outlineIndicator: true,
              )
            ],
          ),
        ),
        FlatSectionHeader(
          title: "特别关注",
          textColor: Colors.teal,
        ),
        FlatChatItem(
          onPressed: () {

          },
          name: "Akshaye JH",
          nameColor: Colors.black,
          messageColor: Colors.grey,
          profileImage: FlatProfileImage(
            imageUrl: "https://cdn.dribbble.com/users/1281912/avatars/normal/febecc326c76154551f9d4bbab73f97b.jpg?1468927304",
            onlineIndicator: true,
          ),
          message: "Hello World!, Welcome to Flat Social - Flutter UI Kit.",
          multiLineMessage: true,
          counter: FlatCounter(
            text: "1",
          ),
        ),
        FlatSectionHeader(
          title: "聊天",
          textColor: Colors.teal,
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "Alix Cage",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1536057222397-e51989d3cb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "And His Brother",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "And Sister",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1521235042493-c5bef89dc2c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1385&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "Father",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "Mother",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "Not From Family",
        )
      ],
    );
  }
}