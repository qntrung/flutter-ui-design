// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/travel/constant.dart';
import 'package:travel_app/travel/models/travel_model.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    super.key,
    required this.destination,
  });

  final TravelDestination destination;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: const Icon(
                Iconsax.arrow_left_2,
                size: 32,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Detail Place",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: const Icon(
              Iconsax.bookmark,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 5),
                      blurRadius: 7,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            pageView = value;
                          });
                        },
                        children: List.generate(
                          widget.destination.image!.length,
                          (index) => Image.network(
                            widget.destination.image![index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: widget.destination.image!.length - 1 !=
                                          pageView
                                      ? NetworkImage(widget
                                          .destination.image![pageView + 1])
                                      : NetworkImage(
                                          widget.destination.image![0]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.black54),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      widget.destination.image!.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          if (pageController.hasClients) {
                                            pageController.animateToPage(
                                              index,
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          height: 5,
                                          width: 20,
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: pageView == index
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.destination.name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Iconsax.location,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                widget.destination.location,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Iconsax.star1,
                                                size: 20,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                widget.destination.rate
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "(${widget.destination.review} reviews)",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.54,
                        child: const TabBar(
                          labelColor: blueTextColor,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelColor: Colors.black,
                          indicatorColor: blueTextColor,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: "Overview"),
                            Tab(text: "Review"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.destination.description,
                                maxLines: 3,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text('No Review yet'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // padding: const EdgeInsets.all(20),
        height: 110,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "\$${widget.destination.price}",
                          style: const TextStyle(
                              color: blueTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                        const TextSpan(
                          text: "/ Person",
                          style: TextStyle(
                              color: kButtonColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kButtonColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 5),
                      blurRadius: 7,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Text("Add to Cart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
