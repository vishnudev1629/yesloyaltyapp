import 'dart:math';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<Color> baseColors = [];
  List<Color> gradientColors = [];
  List<Color> lighterColors = [];
  Color _generateDarkColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(156), // Limit to 0-155 to ensure dark color
      random.nextInt(156),
      random.nextInt(156),
    );
  }

  Color _generateSlightVariationColor(Color baseColor) {
    HSLColor hslColor = HSLColor.fromColor(baseColor);
    double newLightness =
        (hslColor.lightness + 0.1).clamp(0.0, 0.5); // Ensure it remains dark
    return hslColor.withLightness(newLightness).toColor();
  }

  Color _generateLighterColorWithAlpha(Color color) {
    HSLColor hslColor = HSLColor.fromColor(color);
    HSLColor lighterHslColor =
        hslColor.withLightness((hslColor.lightness + 0.4).clamp(0.0, 1.0));
    Color lighterColor = lighterHslColor.toColor();
    return lighterColor.withAlpha(140);
  }

  String _formatExpiryDateWithMonthAsString(String? expiryEnd) {
    if (expiryEnd == null) return '';

    // Parse the expiry date string into a DateTime object
    DateTime expiryDateTime = DateTime.parse(expiryEnd);

    // Get the numeric month and convert it to string representation
    int month = expiryDateTime.month;
    String monthAsString = _getMonthAsString(month);

    // Format the expiry date using the desired format
    String formattedDate =
        DateFormat('d\'${_getDaySuffix(expiryDateTime.day)}\' MMMM yyyy')
            .format(expiryDateTime);

    // Replace the numeric month with its string representation in the formatted date
    formattedDate = formattedDate.replaceFirst(RegExp(r'MMMM'), monthAsString);

    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthAsString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<OffersListBloc>()
          .add(const OffersListEvent.fetchOffersList());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user details when the widget is built
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   context
    //       .read<OffersListBloc>()
    //       .add(const OffersListEvent.fetchOffersList());
    // });
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double screenheight = screenHeight(context);
    // double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    String formatExpiryDate(String? expiryEnd) {
      if (expiryEnd == null || expiryEnd.isEmpty) {
        return 'Currently Available';
      }

      try {
        DateTime parsedDate = DateTime.parse(expiryEnd);
        String day = DateFormat('d').format(parsedDate);
        String suffix = 'th';

        if (day.endsWith('1') && day != '11') {
          suffix = 'st';
        } else if (day.endsWith('2') && day != '12') {
          suffix = 'nd';
        } else if (day.endsWith('3') && day != '13') {
          suffix = 'rd';
        }

        String formattedDate =
            DateFormat("d'$suffix' MMMM yyyy").format(parsedDate);
        return formattedDate;
      } catch (e) {
        return 'Currently Available';
      }
    }

    return BlocBuilder<OffersListBloc, OffersListState>(
        builder: (context, state) {
      print('error-------------------------${state.isError}');
      print('loading-------------------------${state.isLoading}');
      print('success-------------------------${state.offersList.message}');
      print('object${state.offersList.message.toString()}');
      if (state.isLoading) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              MasonryGridView.count(
                padding: outerpadding,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 19,
                crossAxisSpacing: 18,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      height: 175,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height23),
            ],
          ),
        );
      } else if (state.isError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: Image.asset('assets/offers_error.png')),
            Center(child: Image.asset('assets/No_Offers.png')),
            const SizedBox(height: 30),
            const Text('No offers found!')
          ],
        );
      }
      if (state.offersList.data != null && state.offersList.data!.isNotEmpty) {
        if (baseColors.isEmpty ||
            gradientColors.isEmpty ||
            lighterColors.isEmpty ||
            baseColors.length != state.offersList.data!.length ||
            gradientColors.length != state.offersList.data!.length) {
          baseColors.clear();
          lighterColors.clear();
          gradientColors.clear();
          for (var i = 0; i < state.offersList.data!.length; i++) {
            Color baseColor = _generateDarkColor();
            baseColors.add(baseColor);
            gradientColors.add(_generateSlightVariationColor(baseColor));
            lighterColors.add(_generateLighterColorWithAlpha(
              baseColor,
            )); // Set alpha to 77
          }
        }
        if (gradientColors.length == state.offersList.data!.length) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                MasonryGridView.count(
                  padding: outerpadding,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 19,
                  crossAxisSpacing: 18,
                  itemCount: state.offersList.data?.length ?? 3,
                  itemBuilder: (context, index) {
                    String expiryEnd =
                        '${state.offersList.data?[index].expiryEnd}';
                    String formattedDate = formatExpiryDate(expiryEnd);
                    return ContentBox(
                        lineargradient1: baseColors[index],
                        lineargradient2: gradientColors[index],
                        offerinfo: '${state.offersList.data?[index].name}' ??
                            'Special Offer',
                        comments: '${state.offersList.data?[index].comments}' ??
                            'Special Offer',
                        expiryDate:
                            '${formattedDate == "Currently Available" ? 'Currently Available' : 'Valid up to ${formattedDate}'}',
                        lighterColor: lighterColors[index],
                        branchName:
                            '${state.offersList.data?[index].branchName}' ??
                                'Special Offer',
                        brochure_url:
                            '${state.offersList.data?[index].brochureUrl}' ??
                                '');
                  },
                ),
                SizedBox(height: height23),
              ],
            ),
          );
        }
      } else if (state.offersList.data == null ||
          state.offersList.data!.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/No_Offers.png')),
            const SizedBox(height: 30),
            const Text('No offers found!')
          ],
        );
      }
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            MasonryGridView.count(
              padding: outerpadding,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 18,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 175,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height23),
          ],
        ),
      );
    });
  }
}

class ContentBox extends StatelessWidget {
  final String offerinfo;
  final String comments;
  final String branchName;
  final Color lighterColor;
  final String expiryDate;
  final lineargradient1;
  final lineargradient2;
  String brochure_url;
  ContentBox({
    super.key,
    required this.offerinfo,
    required this.lineargradient1,
    required this.lineargradient2,
    required this.expiryDate,
    required this.comments,
    required this.lighterColor,
    required this.branchName,
    required this.brochure_url,
  });
  // final double height;
  String _formatExpiryDateWithMonthAsString(String? expiryEnd) {
    if (expiryEnd == null) return '';

    // Parse the expiry date string into a DateTime object
    DateTime expiryDateTime = DateTime.parse(expiryEnd);

    // Get the numeric month and convert it to string representation
    int month = expiryDateTime.month;
    String monthAsString = _getMonthAsString(month);

    // Format the expiry date using the desired format
    String formattedDate =
        DateFormat('d\'${_getDaySuffix(expiryDateTime.day)}\' MMMM yyyy')
            .format(expiryDateTime);

    // Replace the numeric month with its string representation in the formatted date
    formattedDate = formattedDate.replaceFirst(RegExp(r'MMMM'), monthAsString);

    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthAsString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    brochure_url =
        (brochure_url == 'null' || brochure_url.isEmpty || brochure_url == null)
            ? 'null'
            : brochure_url;
    return Container(
      width: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              lineargradient1,
              lineargradient2,
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 17,
              bottom: 17,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Offer',
                  style: TextStyles.rubik12whiteFFw400,
                ),
                const SizedBox(height: 5),
                Text(offerinfo, style: TextStyles.rubik18whiteFFw600),
                const SizedBox(height: 11),
                Text(
                  comments,
                  style: TextStyles.rubik12whiteFFw400,
                ),
                const SizedBox(height: 11),
                Text(expiryDate, style: TextStyles.rubik9whiteFFw300),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: lighterColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Text(
                  limitString(branchName, 15),
                  style: TextStyles.rubik12whiteFFw500,
                ),
                Spacer(),
                brochure_url == 'null'
                    ? SizedBox.shrink()
                    : Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              navigateTopdfScreen(context,broshureUrl:brochure_url );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  SvgPicture.asset('assets/download_icon.svg'),
                            )),
                      ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String limitString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }
}
