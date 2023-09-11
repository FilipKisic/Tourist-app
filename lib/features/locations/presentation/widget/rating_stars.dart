import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/style/colors.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          itemCount: rating,
          shrinkWrap: true,
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Icon(
            Icons.star_rounded,
            color: whiteColor,
          ),
          itemCount: 5 - rating,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
