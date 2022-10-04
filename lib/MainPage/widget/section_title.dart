import 'package:flutter/material.dart';

import 'package:trip_wizard/MainPage/widget/social_base.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: press,
            child: const Text("See All"),
          ),
        ],
      ),
    );
  }
}