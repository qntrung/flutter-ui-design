import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/travel/constant.dart';
import 'package:travel_app/travel/models/travel_model.dart';
import 'package:travel_app/travel/pages/place_detail.dart';
import 'package:travel_app/travel/widgets/popular_place.dart';
import 'package:travel_app/travel/widgets/recommend_place.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
// bottom bar icon
  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home_1,
    Iconsax.search_normal,
    Iconsax.ticket,
    Iconsax.bookmark,
    Iconsax.user,
  ];
  //get list popular info
  List<TravelDestination> popular =
      myDestination.where((dest) => dest.category == 'popular').toList();
  //get list recommend info
  List<TravelDestination> recommend =
      myDestination.where((dest) => dest.category == 'recommend').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: headerPart(),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular place",
                  style: TextStyle(
                      fontSize: 20,
                      color: kButtonColor,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 15,
                    color: blueTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: List.generate(
                popular.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlaceDetailScreen(
                              destination: popular[index],
                            ),
                          ),
                        );
                      },
                      child: PopularPlace(destination: popular[index])),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation for you",
                  style: TextStyle(
                      fontSize: 20,
                      color: kButtonColor,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 15,
                    color: blueTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: List.generate(
                  recommend.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlaceDetailScreen(
                                destination: recommend[index],
                              ),
                            ),
                          );
                        },
                        child: RecommendPlace(destination: recommend[index])),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.9,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            icons.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              child: Icon(
                                icons[index],
                                size: 32,
                                color: selectedPage == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar headerPart() {
    return AppBar(
      leadingWidth: 180,
      elevation: 0,
      leading: const Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(
            Iconsax.location4,
            color: Colors.black,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            "Juwa Timur",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black26,
          )
        ],
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black26,
              )),
          child: const Stack(
            children: [
              Icon(
                Iconsax.notification,
                color: Colors.black,
                size: 30,
              ),
              Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
