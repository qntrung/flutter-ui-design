// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/travel/models/travel_model.dart';

class PopularPlace extends StatelessWidget {
  const PopularPlace({
    super.key,
    required this.destination,
  });

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  spreadRadius: 15,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 210,
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  destination.image![1],
                ),
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  color: Colors.black45.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.location5,
                                  size: 13,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  destination.location,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.star1,
                              color: Colors.orange,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              destination.rate.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
