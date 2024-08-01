import 'package:flutter/material.dart';

class OnBoardingItemModel {
  const OnBoardingItemModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.titleColor,
    this.subtitleColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  final String title;
  final String subtitle;
  final String image;
  final Color? titleColor;
  final Color? subtitleColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
}
