import 'package:flutter/material.dart';

class AppSpacing{
  AppSpacing._();

  static const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
static const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
static const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
static const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
static const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

// Vertical Spacing
static const Widget verticalSpaceTiny = SizedBox(height: 5.0);
static const Widget verticalSpaceSmall = SizedBox(height: 10.0);
static const Widget verticalSpaceRegular = SizedBox(height: 18.0);
static const Widget verticalSpaceMedium = SizedBox(height: 25);
static const Widget verticalSpaceLarge = SizedBox(height: 50.0);
static const Widget verticalSpaceMassive = SizedBox(height: 120.0);
}