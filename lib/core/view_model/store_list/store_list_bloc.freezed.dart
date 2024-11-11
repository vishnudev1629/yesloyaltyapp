// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchStoreList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchStoreList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchStoreList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_fetchStoreList value) fetchStoreList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_fetchStoreList value)? fetchStoreList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_fetchStoreList value)? fetchStoreList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreListEventCopyWith<$Res> {
  factory $StoreListEventCopyWith(
          StoreListEvent value, $Res Function(StoreListEvent) then) =
      _$StoreListEventCopyWithImpl<$Res, StoreListEvent>;
}

/// @nodoc
class _$StoreListEventCopyWithImpl<$Res, $Val extends StoreListEvent>
    implements $StoreListEventCopyWith<$Res> {
  _$StoreListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreListEvent
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
    extends _$StoreListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'StoreListEvent.started()';
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
    required TResult Function() fetchStoreList,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchStoreList,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchStoreList,
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
    required TResult Function(_fetchStoreList value) fetchStoreList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_fetchStoreList value)? fetchStoreList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_fetchStoreList value)? fetchStoreList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements StoreListEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$fetchStoreListImplCopyWith<$Res> {
  factory _$$fetchStoreListImplCopyWith(_$fetchStoreListImpl value,
          $Res Function(_$fetchStoreListImpl) then) =
      __$$fetchStoreListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchStoreListImplCopyWithImpl<$Res>
    extends _$StoreListEventCopyWithImpl<$Res, _$fetchStoreListImpl>
    implements _$$fetchStoreListImplCopyWith<$Res> {
  __$$fetchStoreListImplCopyWithImpl(
      _$fetchStoreListImpl _value, $Res Function(_$fetchStoreListImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$fetchStoreListImpl implements _fetchStoreList {
  const _$fetchStoreListImpl();

  @override
  String toString() {
    return 'StoreListEvent.fetchStoreList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchStoreListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchStoreList,
  }) {
    return fetchStoreList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchStoreList,
  }) {
    return fetchStoreList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchStoreList,
    required TResult orElse(),
  }) {
    if (fetchStoreList != null) {
      return fetchStoreList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_fetchStoreList value) fetchStoreList,
  }) {
    return fetchStoreList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_fetchStoreList value)? fetchStoreList,
  }) {
    return fetchStoreList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_fetchStoreList value)? fetchStoreList,
    required TResult orElse(),
  }) {
    if (fetchStoreList != null) {
      return fetchStoreList(this);
    }
    return orElse();
  }
}

abstract class _fetchStoreList implements StoreListEvent {
  const factory _fetchStoreList() = _$fetchStoreListImpl;
}

/// @nodoc
mixin _$StoreListState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  StoreList get storeDetails => throw _privateConstructorUsedError;
  Option<Either<MainFailure, StoreList>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of StoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreListStateCopyWith<StoreListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreListStateCopyWith<$Res> {
  factory $StoreListStateCopyWith(
          StoreListState value, $Res Function(StoreListState) then) =
      _$StoreListStateCopyWithImpl<$Res, StoreListState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      StoreList storeDetails,
      Option<Either<MainFailure, StoreList>> successorFailure});
}

/// @nodoc
class _$StoreListStateCopyWithImpl<$Res, $Val extends StoreListState>
    implements $StoreListStateCopyWith<$Res> {
  _$StoreListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreListState
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
              as StoreList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, StoreList>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreListStateImplCopyWith<$Res>
    implements $StoreListStateCopyWith<$Res> {
  factory _$$StoreListStateImplCopyWith(_$StoreListStateImpl value,
          $Res Function(_$StoreListStateImpl) then) =
      __$$StoreListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      StoreList storeDetails,
      Option<Either<MainFailure, StoreList>> successorFailure});
}

/// @nodoc
class __$$StoreListStateImplCopyWithImpl<$Res>
    extends _$StoreListStateCopyWithImpl<$Res, _$StoreListStateImpl>
    implements _$$StoreListStateImplCopyWith<$Res> {
  __$$StoreListStateImplCopyWithImpl(
      _$StoreListStateImpl _value, $Res Function(_$StoreListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? storeDetails = null,
    Object? successorFailure = null,
  }) {
    return _then(_$StoreListStateImpl(
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
              as StoreList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, StoreList>>,
    ));
  }
}

/// @nodoc

class _$StoreListStateImpl implements _StoreListState {
  const _$StoreListStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.storeDetails,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final StoreList storeDetails;
  @override
  final Option<Either<MainFailure, StoreList>> successorFailure;

  @override
  String toString() {
    return 'StoreListState(isLoading: $isLoading, isError: $isError, storeDetails: $storeDetails, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreListStateImpl &&
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

  /// Create a copy of StoreListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreListStateImplCopyWith<_$StoreListStateImpl> get copyWith =>
      __$$StoreListStateImplCopyWithImpl<_$StoreListStateImpl>(
          this, _$identity);
}

abstract class _StoreListState implements StoreListState {
  const factory _StoreListState(
      {required final bool isLoading,
      required final bool isError,
      required final StoreList storeDetails,
      required final Option<Either<MainFailure, StoreList>>
          successorFailure}) = _$StoreListStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  StoreList get storeDetails;
  @override
  Option<Either<MainFailure, StoreList>> get successorFailure;

  /// Create a copy of StoreListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreListStateImplCopyWith<_$StoreListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
