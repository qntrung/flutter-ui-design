import 'package:flutter/material.dart';
import 'package:travel_app/travel/constant.dart';
import 'package:travel_app/travel/models/onboard_model.dart';
import 'package:travel_app/travel/pages/travel_home.dart';

class OnboardTravelScreen extends StatefulWidget {
  const OnboardTravelScreen({super.key});

  @override
  _OnboardTravelScreenState createState() => _OnboardTravelScreenState();
}

class _OnboardTravelScreenState extends State<OnboardTravelScreen> {
  int currentIndex = 0;

  Widget dotGenerator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 6),
      width: 30,
      height: 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index == currentIndex ? Colors.white : Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboarding.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                onboarding[index].image,
                fit: BoxFit.cover,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TravelHomeScreen(),
                            ),
                            (route) => false);
                      },
                      child: Visibility(
                        visible: currentIndex != onboarding.length - 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFF1F3F4)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          onboarding[currentIndex].name,
                          style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "We travellin are ready to help you on vacation on Nepal",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 230,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboarding.length, dotGenerator),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: kBackgroundColor,
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const TravelHomeScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: Container(
                              height: 75,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 5),
                                      spreadRadius: 15,
                                      blurRadius: 15,
                                    )
                                  ]),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Let's Get Started",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: kBackgroundColor),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: kBackgroundColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "already have account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kButtonColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: blueTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
