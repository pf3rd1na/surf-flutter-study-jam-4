import 'package:flutter/material.dart';

// Figma screen dimensions
/// Reference height for Figma screen.
double kReferenceHeight = 812;

/// Reference width for Figma screen.
double kReferenceWidth = 375;

// Current app screen dimensions
/// Current screen height.
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// Current screen width.
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Methods to calculate element dimensions for current screen size
/// Calculates element height for current screen size. [referenceHeight] is a height of element on Figma screen.
double elementHeight(double referenceHeight, BuildContext context) =>
    referenceHeight * screenHeight(context) / kReferenceHeight;

/// Calculates element width for current screen size. [referenceWidth] is a width of element on Figma screen.
double elementWidth(double referenceWidth, BuildContext context) =>
    referenceWidth * screenWidth(context) / kReferenceWidth;

/// Calculates text scale factor for current screen size.
double textScaleFactor(BuildContext context) =>
    screenHeight(context) / kReferenceHeight;
