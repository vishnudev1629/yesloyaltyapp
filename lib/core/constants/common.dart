import 'package:flutter/material.dart';

double figmaDeviceHeight = 812;
double figmaDeviceWidth = 375;
double figmaDevicePadding = 30;
double textinputHeight = 57;
double textareaHeight = 114;
double textFieldElementGap = 16;
double textfieldElementHorizontal = 17;
double textfieldElementVertical = 15;
double elemgapHorizontal = 16;

/// Full width of the device
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Full height of the device
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Outermost padding used on the left and right side of every page.
double outerPadding(BuildContext context) {
  return (screenWidth(context) * 30) / figmaDeviceWidth;
}

/// Actual usable width after reducing the outerPadding from screenWidth
double innerWidth(BuildContext context) {
  return (screenWidth(context)) - outerPadding(context);
}

/// Common Height of an input box
double inputHeight(BuildContext context) {
  return (screenHeight(context) * textinputHeight) / figmaDeviceHeight;
}

/// Common Height of a multi-line text input box
double textAreaHeight(BuildContext context) {
  return (screenHeight(context) * textareaHeight) / figmaDeviceHeight;
}

/// Common gap given between a element's bottom border, and the next element's top border
double elemPaddingVertical(BuildContext context) {
  return (screenHeight(context) * textFieldElementGap) / figmaDeviceHeight;
}

/// Common padding given inside an element's border on the right and left side
double elemPaddingHorizontal(BuildContext context) {
  return (screenWidth(context) * textfieldElementHorizontal) / figmaDeviceWidth;
}

/// Common padding given inside an element's border on the top and bottom side
double elemGapVertical(BuildContext context) {
  return (screenHeight(context) * textfieldElementVertical) / figmaDeviceHeight;
}

/// Common gap given between a element's border on the right, and the next element's border on the left
double elemGapHorizontal(BuildContext context) {
  return (screenWidth(context) * elemgapHorizontal) / figmaDeviceWidth;
}

/// Space between horizontal items
double spacingVertical(BuildContext context,{required double height}) {
  return (screenHeight(context) * height) / figmaDeviceHeight;
}

/// Space between vertical items
double spacingHorizontal(BuildContext context,{required double width}) {
  return (screenWidth(context) * width) / figmaDeviceWidth;
}



