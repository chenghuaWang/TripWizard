import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:trip_wizard/MainPage/widget/social_base.dart';
import 'package:trip_wizard/MainPage/widget/section_title.dart';
import 'package:trip_wizard/MainPage/widget/social_cards.dart';
import 'package:trip_wizard/MainPage/widget/social_spot.dart';

import 'package:trip_wizard/MainPage/layers/map_location_details2.dart';

class PopularTourModel {
  late String imgUrl;
  late String title;
  late String desc;
  late String price;
  late double rating;
}

class CountryModel {
  late String label;
  late String countryName;
  late int noOfTours;
  late double rating;
  late String imgUrl;

  CountryModel();
}

List<CountryModel> getCountrys() {
  List<CountryModel> country = [];
  CountryModel countryModel = CountryModel();

//1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Malaysia";
  countryModel.label = "Sale";
  countryModel.noOfTours = 12;
  countryModel.rating = 4.3;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/3568489/pexels-photo-3568489.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  //1
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  country.add(countryModel);
  countryModel = CountryModel();

  return country;
}

List<PopularTourModel> getPopularTours() {
  List<PopularTourModel> popularTourModels = [];
  PopularTourModel popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Cuba";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 499.99";
  popularTourModel.rating = 4.5;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1477430/pexels-photo-1477430.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Dominican";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.2;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

//1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel = PopularTourModel();

  return popularTourModels;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];

  @override
  void initState() {
    country = getCountrys();
    popularTourModels = getPopularTours();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildSocialList() {
    return Column(
      children: [
        SectionTitle(
          title: "在线的群组",
          press: () {

          },
        ),
        const VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                travelSpots.length,
                    (index) => Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding)),
                  child: PlaceCard(
                    travelSport: travelSpots[index],
                    press: () {},
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SectionTitle(
          title: "Top 的旅行者",
          press: () {

          },
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
          // height: getProportionateScreenWidth(143),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [kDefualtShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                topTravelers.length,
                    (index) => UserCard(
                  user: topTravelers[index],
                  press: () {

                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightTheme.backgroundColor,
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(
              Icons.subject,
              color: Colors.black38,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  width: 218,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: const InputDecoration.collapsed(
                              hintText: 'TripWizard',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal,
                                  fontFamily: 'WorkSansBold'),
                            ),
                            onTap: () {
                              // TODO add search page
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.black38,
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "发现好玩的去处",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "热门国家",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 240,
                  child: ListView.builder(
                      itemCount: country.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CountryListTile(
                          label: country[index].label,
                          countryName: country[index].countryName,
                          noOfTours: country[index].noOfTours,
                          rating: country[index].rating,
                          imgUrl: country[index].imgUrl,
                        );
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "热门地点",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: popularTourModels.length,
                    itemBuilder: (context, index) {
                      return PopularTours(
                        desc: popularTourModels[index].desc,
                        imgUrl: popularTourModels[index].imgUrl,
                        title: popularTourModels[index].title,
                        price: popularTourModels[index].price,
                        rating: popularTourModels[index].rating,
                      );
                    }),
                _buildSocialList(),
              ],
            )),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;

  const PopularTours(
      {super.key,
      required this.imgUrl,
      required this.rating,
      required this.desc,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                  imgUrl: imgUrl,
                  placeName: title,
                  rating: rating,
                )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: const Color(0xffE9F4F9),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4E6059)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff89A097)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4E6059)),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10, right: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xff139157)),
                child: Column(
                  children: [
                    Text(
                      "$rating",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;

  const CountryListTile(
      {super.key,
      required this.countryName,
      required this.label,
      required this.noOfTours,
      required this.rating,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 8, top: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38),
                        child: Text(
                          label ?? "New",
                          style: const TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              "Thailand",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "18 Tours",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10, right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white38),
                        child: Column(
                          children: const [
                            Text(
                              "4.5",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key,
    required this.user,
    required this.press,
  });

  final User user;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              user.image,
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              fit: BoxFit.cover,
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
