import 'package:flutter/material.dart';

class SocialRecommendDetails extends StatefulWidget {
  const SocialRecommendDetails({super.key});

  @override
  _SocialRecommendDetailsState createState() => _SocialRecommendDetailsState();
}

class _SocialRecommendDetailsState extends State<SocialRecommendDetails> {

  List<Widget> _buildAllItem() {
    List<Widget> tmp = [];
    return tmp;
  }

  @override
  Widget build(BuildContext contex) {
    return SingleChildScrollView (
      child: Column(
        children: _buildAllItem(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}