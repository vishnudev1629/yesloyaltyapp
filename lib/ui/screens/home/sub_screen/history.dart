import 'package:Yes_Loyalty/ui/animations/history_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/misc/points_popup/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class History extends StatelessWidget {
  const History({super.key});

  String formatDate(String createdAt) {
    final DateTime dateTime = DateTime.parse(createdAt);
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String formatDateTime(String createdAt) {
    final DateTime dateTime = DateTime.parse(createdAt);
    return DateFormat('dd-MM-yyyy, HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<TransactionDetailsBloc>()
          .add(const TransactionDetailsEvent.fetchTransactionDetails());
    });
    double screenheight = screenHeight(context);
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const HistoryShimmer();
                } else if (state.isError) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 120),
                        Icon(
                          Icons.comments_disabled_outlined,
                          size: 85,
                        ),
                        Text(
                          "You have no transaction in this branch",
                          style: TextStyles.rubik16black33,
                        ),
                      ],
                    ),
                  );
                } else if (state.transactionDetails.data == null) {
                  return HistoryShimmer();
                } else if (state.transactionDetails.data!.isEmpty) {
                  return const HistoryShimmer();
                } else if (state.transactionDetails.data!.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.transactionDetails.data?.length ?? 3,
                    itemBuilder: (context, index) {
                      String createdAt = state
                          .transactionDetails.data![index].createdAt
                          .toString();
                      String paymentTime = state
                          .transactionDetails.data![index].createdAt
                          .toString();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: PointsHistory(
                          date: formatDate(createdAt),
                          isCredited:
                              state.transactionDetails.data?[index].coinType ==
                                      "credit"
                                  ? true
                                  : false,
                          points:
                              '${state.transactionDetails.data?[index].coins.toString()} pts',
                          paymentTime: formatDateTime(createdAt),
                          cashierName:
                              '${state.transactionDetails.data?[index].cashierName.toString()}',
                          barnch:
                              '${state.transactionDetails.data?[index].branch.toString()}',
                          invoiceId:
                              '${state.transactionDetails.data?[index].invoiceNo.toString()}',
                          coins:
                              '${state.transactionDetails.data?[index].coins.toString()}',
                          transactionId:
                              '${state.transactionDetails.data?[index].id.toString()}',
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(height: height10),
          ],
        ));
  }
}

class PointsHistory extends StatelessWidget {
  final String date;
  final String paymentTime;
  final String barnch;
  final String cashierName;
  final bool isCredited;
  final String points;
  final String coins;
  final String transactionId;
  final String invoiceId;
  const PointsHistory({
    required this.date,
    required this.isCredited,
    required this.coins,
    required this.points,
    required this.paymentTime,
    required this.barnch,
    required this.invoiceId,
    required this.cashierName,
    required this.transactionId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Padding(
      padding: outerpadding,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PopScope(
                // Allow dismissing the popup on initial back press
                canPop: true,
                onPopInvoked: (didPop) {
                  // Check if it's the first back press
                  final isFirstPop = !Navigator.of(context).canPop();

                  if (didPop && isFirstPop) {
                    // Close the dialog without navigation
                    Navigator.of(context).pop(); // No need for (false) argument
                  }
                },
                child: PointsCredited(
                  paymentTime: paymentTime,
                  barnchName: barnch,
                  cashierName: cashierName,
                  isCredited: isCredited,
                  coins: coins,
                  transactionId: transactionId,
                ), // Your dialog content
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyles.rubik16black33,
                    ),
                    const SizedBox(height: 8),
                    isCredited == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/increment.svg'),
                              const SizedBox(width: 5),
                              Text(
                                'Loyalty Credited',
                                style: TextStyles.rubik14black33w300,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/decrement.svg'),
                              const SizedBox(width: 5),
                              Text(
                                'Loyalty Debited',
                                style: TextStyles.rubik14black33w300,
                              ),
                            ],
                          )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      points,
                      style: TextStyles.rubik16black33,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
