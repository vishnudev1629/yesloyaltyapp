// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchTransactionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchTransactionDetails value)
        fetchTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchTransactionDetails value)? fetchTransactionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchTransactionDetails value)? fetchTransactionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsEventCopyWith<$Res> {
  factory $TransactionDetailsEventCopyWith(TransactionDetailsEvent value,
          $Res Function(TransactionDetailsEvent) then) =
      _$TransactionDetailsEventCopyWithImpl<$Res, TransactionDetailsEvent>;
}

/// @nodoc
class _$TransactionDetailsEventCopyWithImpl<$Res,
        $Val extends TransactionDetailsEvent>
    implements $TransactionDetailsEventCopyWith<$Res> {
  _$TransactionDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TransactionDetailsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchTransactionDetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchTransactionDetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchTransactionDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchTransactionDetails value)
        fetchTransactionDetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchTransactionDetails value)? fetchTransactionDetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchTransactionDetails value)? fetchTransactionDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TransactionDetailsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchTransactionDetailsImplCopyWith<$Res> {
  factory _$$FetchTransactionDetailsImplCopyWith(
          _$FetchTransactionDetailsImpl value,
          $Res Function(_$FetchTransactionDetailsImpl) then) =
      __$$FetchTransactionDetailsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchTransactionDetailsImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$FetchTransactionDetailsImpl>
    implements _$$FetchTransactionDetailsImplCopyWith<$Res> {
  __$$FetchTransactionDetailsImplCopyWithImpl(
      _$FetchTransactionDetailsImpl _value,
      $Res Function(_$FetchTransactionDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchTransactionDetailsImpl implements _FetchTransactionDetails {
  const _$FetchTransactionDetailsImpl();

  @override
  String toString() {
    return 'TransactionDetailsEvent.fetchTransactionDetails()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTransactionDetailsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchTransactionDetails,
  }) {
    return fetchTransactionDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchTransactionDetails,
  }) {
    return fetchTransactionDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchTransactionDetails,
    required TResult orElse(),
  }) {
    if (fetchTransactionDetails != null) {
      return fetchTransactionDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchTransactionDetails value)
        fetchTransactionDetails,
  }) {
    return fetchTransactionDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchTransactionDetails value)? fetchTransactionDetails,
  }) {
    return fetchTransactionDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchTransactionDetails value)? fetchTransactionDetails,
    required TResult orElse(),
  }) {
    if (fetchTransactionDetails != null) {
      return fetchTransactionDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchTransactionDetails implements TransactionDetailsEvent {
  const factory _FetchTransactionDetails() = _$FetchTransactionDetailsImpl;
}

/// @nodoc
mixin _$TransactionDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  TransactionDetails get transactionDetails =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, TransactionDetails>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionDetailsStateCopyWith<TransactionDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsStateCopyWith<$Res> {
  factory $TransactionDetailsStateCopyWith(TransactionDetailsState value,
          $Res Function(TransactionDetailsState) then) =
      _$TransactionDetailsStateCopyWithImpl<$Res, TransactionDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      TransactionDetails transactionDetails,
      Option<Either<MainFailure, TransactionDetails>> successorFailure});
}

/// @nodoc
class _$TransactionDetailsStateCopyWithImpl<$Res,
        $Val extends TransactionDetailsState>
    implements $TransactionDetailsStateCopyWith<$Res> {
  _$TransactionDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? transactionDetails = null,
    Object? successorFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionDetails: null == transactionDetails
          ? _value.transactionDetails
          : transactionDetails // ignore: cast_nullable_to_non_nullable
              as TransactionDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, TransactionDetails>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailsStateImplCopyWith<$Res>
    implements $TransactionDetailsStateCopyWith<$Res> {
  factory _$$TransactionDetailsStateImplCopyWith(
          _$TransactionDetailsStateImpl value,
          $Res Function(_$TransactionDetailsStateImpl) then) =
      __$$TransactionDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      TransactionDetails transactionDetails,
      Option<Either<MainFailure, TransactionDetails>> successorFailure});
}

/// @nodoc
class __$$TransactionDetailsStateImplCopyWithImpl<$Res>
    extends _$TransactionDetailsStateCopyWithImpl<$Res,
        _$TransactionDetailsStateImpl>
    implements _$$TransactionDetailsStateImplCopyWith<$Res> {
  __$$TransactionDetailsStateImplCopyWithImpl(
      _$TransactionDetailsStateImpl _value,
      $Res Function(_$TransactionDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? transactionDetails = null,
    Object? successorFailure = null,
  }) {
    return _then(_$TransactionDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionDetails: null == transactionDetails
          ? _value.transactionDetails
          : transactionDetails // ignore: cast_nullable_to_non_nullable
              as TransactionDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, TransactionDetails>>,
    ));
  }
}

/// @nodoc

class _$TransactionDetailsStateImpl implements _TransactionDetailsState {
  const _$TransactionDetailsStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.transactionDetails,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final TransactionDetails transactionDetails;
  @override
  final Option<Either<MainFailure, TransactionDetails>> successorFailure;

  @override
  String toString() {
    return 'TransactionDetailsState(isLoading: $isLoading, isError: $isError, transactionDetails: $transactionDetails, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.transactionDetails, transactionDetails) ||
                other.transactionDetails == transactionDetails) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, transactionDetails, successorFailure);

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailsStateImplCopyWith<_$TransactionDetailsStateImpl>
      get copyWith => __$$TransactionDetailsStateImplCopyWithImpl<
          _$TransactionDetailsStateImpl>(this, _$identity);
}

abstract class _TransactionDetailsState implements TransactionDetailsState {
  const factory _TransactionDetailsState(
      {required final bool isLoading,
      required final bool isError,
      required final TransactionDetails transactionDetails,
      required final Option<Either<MainFailure, TransactionDetails>>
          successorFailure}) = _$TransactionDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  TransactionDetails get transactionDetails;
  @override
  Option<Either<MainFailure, TransactionDetails>> get successorFailure;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionDetailsStateImplCopyWith<_$TransactionDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
