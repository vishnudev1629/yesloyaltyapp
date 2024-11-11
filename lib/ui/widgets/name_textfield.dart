// ignore_for_file: must_be_immutable
import 'package:flutter/services.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';


class NameTextfield extends StatefulWidget {
  var errorText;
  final String? hintText;
  final FocusNode focusNode;
  final bool enabled;
   TextEditingController textEditingController = TextEditingController();
  final TextStyle textstyle;
  NameTextfield({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.focusNode,
    required this.textstyle,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<NameTextfield> createState() => _NameTextfieldState();
}

class _NameTextfieldState extends State<NameTextfield> {
  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    // Create an input formatter to accept only strings
    final inputFormatter =
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConstants.greyF7,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: TextField(
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        style: widget.textstyle,
        controller: widget.textEditingController,
        inputFormatters: [inputFormatter], // Set the input formatter
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
          hintText: widget.hintText,
          errorText: widget.errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}



