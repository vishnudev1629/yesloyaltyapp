// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String storeId) fetchStoreDetails,
    required TResult Function() clearStoreDetailsData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? fetchStoreDetails,
    TResult? Function()? clearStoreDetailsData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? fetchStoreDetails,
    TResult Function()? clearStoreDetailsData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchStoreDetails value) fetchStoreDetails,
    required TResult Function(_ClearStoreDetailsData value)
        clearStoreDetailsData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult? Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailsEventCopyWith<$Res> {
  factory $StoreDetailsEventCopyWith(
          StoreDetailsEvent value, $Res Function(StoreDetailsEvent) then) =
      _$StoreDetailsEventCopyWithImpl<$Res, StoreDetailsEvent>;
}

/// @nodoc
class _$StoreDetailsEventCopyWithImpl<$Res, $Val extends StoreDetailsEvent>
    implements $StoreDetailsEventCopyWith<$Res> {
  _$StoreDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreDetailsEvent
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
    extends _$StoreDetailsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'StoreDetailsEvent.started()';
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
    required TResult Function(String storeId) fetchStoreDetails,
    required TResult Function() clearStoreDetailsData,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? fetchStoreDetails,
    TResult? Function()? clearStoreDetailsData,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? fetchStoreDetails,
    TResult Function()? clearStoreDetailsData,
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
    required TResult Function(_FetchStoreDetails value) fetchStoreDetails,
    required TResult Function(_ClearStoreDetailsData value)
        clearStoreDetailsData,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult? Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements StoreDetailsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchStoreDetailsImplCopyWith<$Res> {
  factory _$$FetchStoreDetailsImplCopyWith(_$FetchStoreDetailsImpl value,
          $Res Function(_$FetchStoreDetailsImpl) then) =
      __$$FetchStoreDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String storeId});
}

/// @nodoc
class __$$FetchStoreDetailsImplCopyWithImpl<$Res>
    extends _$StoreDetailsEventCopyWithImpl<$Res, _$FetchStoreDetailsImpl>
    implements _$$FetchStoreDetailsImplCopyWith<$Res> {
  __$$FetchStoreDetailsImplCopyWithImpl(_$FetchStoreDetailsImpl _value,
      $Res Function(_$FetchStoreDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$FetchStoreDetailsImpl(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchStoreDetailsImpl implements _FetchStoreDetails {
  _$FetchStoreDetailsImpl({required this.storeId});

  @override
  final String storeId;

  @override
  String toString() {
    return 'StoreDetailsEvent.fetchStoreDetails(storeId: $storeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStoreDetailsImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  /// Create a copy of StoreDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStoreDetailsImplCopyWith<_$FetchStoreDetailsImpl> get copyWith =>
      __$$FetchStoreDetailsImplCopyWithImpl<_$FetchStoreDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String storeId) fetchStoreDetails,
    required TResult Function() clearStoreDetailsData,
  }) {
    return fetchStoreDetails(storeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? fetchStoreDetails,
    TResult? Function()? clearStoreDetailsData,
  }) {
    return fetchStoreDetails?.call(storeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? fetchStoreDetails,
    TResult Function()? clearStoreDetailsData,
    required TResult orElse(),
  }) {
    if (fetchStoreDetails != null) {
      return fetchStoreDetails(storeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchStoreDetails value) fetchStoreDetails,
    required TResult Function(_ClearStoreDetailsData value)
        clearStoreDetailsData,
  }) {
    return fetchStoreDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult? Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
  }) {
    return fetchStoreDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
    required TResult orElse(),
  }) {
    if (fetchStoreDetails != null) {
      return fetchStoreDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchStoreDetails implements StoreDetailsEvent {
  factory _FetchStoreDetails({required final String storeId}) =
      _$FetchStoreDetailsImpl;

  String get storeId;

  /// Create a copy of StoreDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchStoreDetailsImplCopyWith<_$FetchStoreDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearStoreDetailsDataImplCopyWith<$Res> {
  factory _$$ClearStoreDetailsDataImplCopyWith(
          _$ClearStoreDetailsDataImpl value,
          $Res Function(_$ClearStoreDetailsDataImpl) then) =
      __$$ClearStoreDetailsDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStoreDetailsDataImplCopyWithImpl<$Res>
    extends _$StoreDetailsEventCopyWithImpl<$Res, _$ClearStoreDetailsDataImpl>
    implements _$$ClearStoreDetailsDataImplCopyWith<$Res> {
  __$$ClearStoreDetailsDataImplCopyWithImpl(_$ClearStoreDetailsDataImpl _value,
      $Res Function(_$ClearStoreDetailsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearStoreDetailsDataImpl implements _ClearStoreDetailsData {
  const _$ClearStoreDetailsDataImpl();

  @override
  String toString() {
    return 'StoreDetailsEvent.clearStoreDetailsData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearStoreDetailsDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String storeId) fetchStoreDetails,
    required TResult Function() clearStoreDetailsData,
  }) {
    return clearStoreDetailsData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? fetchStoreDetails,
    TResult? Function()? clearStoreDetailsData,
  }) {
    return clearStoreDetailsData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? fetchStoreDetails,
    TResult Function()? clearStoreDetailsData,
    required TResult orElse(),
  }) {
    if (clearStoreDetailsData != null) {
      return clearStoreDetailsData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchStoreDetails value) fetchStoreDetails,
    required TResult Function(_ClearStoreDetailsData value)
        clearStoreDetailsData,
  }) {
    return clearStoreDetailsData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult? Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
  }) {
    return clearStoreDetailsData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchStoreDetails value)? fetchStoreDetails,
    TResult Function(_ClearStoreDetailsData value)? clearStoreDetailsData,
    required TResult orElse(),
  }) {
    if (clearStoreDetailsData != null) {
      return clearStoreDetailsData(this);
    }
    return orElse();
  }
}

abstract class _ClearStoreDetailsData implements StoreDetailsEvent {
  const factory _ClearStoreDetailsData() = _$ClearStoreDetailsDataImpl;
}

/// @nodoc
mixin _$StoreDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  StoreDetails get storeDetails => throw _privateConstructorUsedError;
  Option<Either<MainFailure, StoreDetails>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of StoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreDetailsStateCopyWith<StoreDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailsStateCopyWith<$Res> {
  factory $StoreDetailsStateCopyWith(
          StoreDetailsState value, $Res Function(StoreDetailsState) then) =
      _$StoreDetailsStateCopyWithImpl<$Res, StoreDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      StoreDetails storeDetails,
      Option<Either<MainFailure, StoreDetails>> successorFailure});
}

/// @nodoc
class _$StoreDetailsStateCopyWithImpl<$Res, $Val extends StoreDetailsState>
    implements $StoreDetailsStateCopyWith<$Res> {
  _$StoreDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? storeDetails = null,
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
      storeDetails: null == storeDetails
          ? _value.storeDetails
          : storeDetails // ignore: cast_nullable_to_non_nullable
              as StoreDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, StoreDetails>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreDetailsStateImplCopyWith<$Res>
    implements $StoreDetailsStateCopyWith<$Res> {
  factory _$$StoreDetailsStateImplCopyWith(_$StoreDetailsStateImpl value,
          $Res Function(_$StoreDetailsStateImpl) then) =
      __$$StoreDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      StoreDetails storeDetails,
      Option<Either<MainFailure, StoreDetails>> successorFailure});
}

/// @nodoc
class __$$StoreDetailsStateImplCopyWithImpl<$Res>
    extends _$StoreDetailsStateCopyWithImpl<$Res, _$StoreDetailsStateImpl>
    implements _$$StoreDetailsStateImplCopyWith<$Res> {
  __$$StoreDetailsStateImplCopyWithImpl(_$StoreDetailsStateImpl _value,
      $Res Function(_$StoreDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? storeDetails = null,
    Object? successorFailure = null,
  }) {
    return _then(_$StoreDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      storeDetails: null == storeDetails
          ? _value.storeDetails
          : storeDetails // ignore: cast_nullable_to_non_nullable
              as StoreDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, StoreDetails>>,
    ));
  }
}

/// @nodoc

class _$StoreDetailsStateImpl implements _StoreDetailsState {
  const _$StoreDetailsStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.storeDetails,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final StoreDetails storeDetails;
  @override
  final Option<Either<MainFailure, StoreDetails>> successorFailure;

  @override
  String toString() {
    return 'StoreDetailsState(isLoading: $isLoading, isError: $isError, storeDetails: $storeDetails, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.storeDetails, storeDetails) ||
                other.storeDetails == storeDetails) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, storeDetails, successorFailure);

  /// Create a copy of StoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreDetailsStateImplCopyWith<_$StoreDetailsStateImpl> get copyWith =>
      __$$StoreDetailsStateImplCopyWithImpl<_$StoreDetailsStateImpl>(
          this, _$identity);
}

abstract class _StoreDetailsState implements StoreDetailsState {
  const factory _StoreDetailsState(
      {required final bool isLoading,
      required final bool isError,
      required final StoreDetails storeDetails,
      required final Option<Either<MainFailure, StoreDetails>>
          successorFailure}) = _$StoreDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  StoreDetails get storeDetails;
  @override
  Option<Either<MainFailure, StoreDetails>> get successorFailure;

  /// Create a copy of StoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreDetailsStateImplCopyWith<_$StoreDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
