import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/transaction_details/transaction_details.dart';
import 'package:Yes_Loyalty/core/services/get_service/transaction_service.dart';

part 'transaction_details_event.dart';
part 'transaction_details_state.dart';
part 'transaction_details_bloc.freezed.dart';

class TransactionDetailsBloc
    extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  TransactionDetailsBloc() : super(TransactionDetailsState.initial()) {


         on<_FetchTransactionDetails>((event, emit) async {
       final response = await FetchTransactionService.fetchTransactinData(
            );
      emit(state.copyWith(isLoading: true, isError: false));
      response.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          isError: true,
          successorFailure: optionOf(left(failure)),
        )),
        (offerinfo) => emit(state.copyWith(
          isLoading: false,
          isError: false,
          transactionDetails: offerinfo,
          successorFailure: optionOf(right(offerinfo)),
        )),
      );
    });
  }
}
