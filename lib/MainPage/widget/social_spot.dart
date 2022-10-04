import 'package:flutter/material.dart';

class User {
  final String name, image;

  User({required this.name, required this.image});
}

// Demo List of Top Travelers
List<User> topTravelers = [user1, user2, user3, user4];

// demo user
User user1 = User(name: "神子/我的神子", image: "assets/images/james.png");
User user2 = User(name: "我要抽草神", image: "assets/images/John.png");
User user3 = User(name: "赛诺-坎蒂斯", image: "assets/images/marry.png");
User user4 = User(name: "不是原披", image: "assets/images/rosy.png");

class TravelSpot {
  final String name, image;
  final DateTime date;
  final List<User> users;

  TravelSpot({
    required this.users,
    required this.name,
    required this.image,
    required this.date,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    users: users..shuffle(),
    name: "蒙德酒庄-巴巴托斯",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "冲了流水食堂",
    image: "assets/images/Magical_World.png",
    date: DateTime(2020, 3, 10),
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "宝龙-TacoStar",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
];

List<User> users = [user1, user2, user3];