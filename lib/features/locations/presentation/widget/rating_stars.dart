import 'package:flutter/material.dart';
import 'package:tourist_app/core/style/style_extensions.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? iconSize;

  const RatingStars({
    super.key,
    required this.rating,
    this.activeColor,
    this.inactiveColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: activeColor ?? context.colorRatingActive,
            size: iconSize,
          ),
          itemCount: rating,
          shrinkWrap: true,
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: inactiveColor ?? context.colorRatingInactive,
            size: iconSize,
          ),
          itemCount: 5 - rating,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
