// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/travel/constant.dart';
import 'package:travel_app/travel/models/travel_model.dart';

class RecommendPlace extends StatelessWidget {
  const RecommendPlace({
    super.key,
    required this.destination,
  });

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 95,
            width: 95,
            // padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  destination.image![1],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.location5,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      destination.location,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
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
                      destination.rate.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '(${destination.review} reviews)',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    '\$${destination.price}',
                    style: const TextStyle(
                        color: blueTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "/Person",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );

    // return Container(
    //   height: 105,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 10,
    //     vertical: 5,
    //   ),
    //   child: Row(
    //     children: [
    //       Container(
    //         height: 95,
    //         width: 110,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           image: DecorationImage(
    //             fit: BoxFit.cover,
    //             image: NetworkImage(
    //               destination.image![0],
    //             ),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(width: 10),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               destination.name,
    //               style: const TextStyle(
    //                 fontSize: 16,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //             const SizedBox(height: 10),
    //             Row(
    //               children: [
    //                 const Icon(
    //                   Icons.location_on,
    //                   color: Colors.black,
    //                   size: 16,
    //                 ),
    //                 Text(
    //                   destination.location,
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                     color: Colors.black.withOpacity(0.6),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(height: 5),
    //             Row(
    //               children: [
    //                 Text.rich(
    //                   TextSpan(
    //                     children: [
    //                       TextSpan(
    //                         text: "${destination.rate}",
    //                         style: const TextStyle(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                       TextSpan(
    //                         text: " (${destination.review} reviews)",
    //                         style: TextStyle(
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w400,
    //                           color: Colors.black.withOpacity(0.6),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //       Column(
    //         children: [
    //           const Spacer(),
    //           Text.rich(
    //             TextSpan(
    //               children: [
    //                 TextSpan(
    //                   text: "\$${destination.price}",
    //                   style: const TextStyle(
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                       color: blueTextColor),
    //                 ),
    //                 TextSpan(
    //                   text: " /Person",
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                     color: Colors.black.withOpacity(0.6),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
