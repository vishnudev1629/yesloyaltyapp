// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OffersListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchOffersList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchOffersList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchOffersList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchOffersList value) fetchOffersList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchOffersList value)? fetchOffersList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchOffersList value)? fetchOffersList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersListEventCopyWith<$Res> {
  factory $OffersListEventCopyWith(
          OffersListEvent value, $Res Function(OffersListEvent) then) =
      _$OffersListEventCopyWithImpl<$Res, OffersListEvent>;
}

/// @nodoc
class _$OffersListEventCopyWithImpl<$Res, $Val extends OffersListEvent>
    implements $OffersListEventCopyWith<$Res> {
  _$OffersListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OffersListEvent
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
    extends _$OffersListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OffersListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'OffersListEvent.started()';
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
    required TResult Function() fetchOffersList,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchOffersList,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchOffersList,
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
    required TResult Function(_FetchOffersList value) fetchOffersList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchOffersList value)? fetchOffersList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchOffersList value)? fetchOffersList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OffersListEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchOffersListImplCopyWith<$Res> {
  factory _$$FetchOffersListImplCopyWith(_$FetchOffersListImpl value,
          $Res Function(_$FetchOffersListImpl) then) =
      __$$FetchOffersListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOffersListImplCopyWithImpl<$Res>
    extends _$OffersListEventCopyWithImpl<$Res, _$FetchOffersListImpl>
    implements _$$FetchOffersListImplCopyWith<$Res> {
  __$$FetchOffersListImplCopyWithImpl(
      _$FetchOffersListImpl _value, $Res Function(_$FetchOffersListImpl) _then)
      : super(_value, _then);

  /// Create a copy of OffersListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOffersListImpl implements _FetchOffersList {
  const _$FetchOffersListImpl();

  @override
  String toString() {
    return 'OffersListEvent.fetchOffersList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOffersListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchOffersList,
  }) {
    return fetchOffersList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchOffersList,
  }) {
    return fetchOffersList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchOffersList,
    required TResult orElse(),
  }) {
    if (fetchOffersList != null) {
      return fetchOffersList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchOffersList value) fetchOffersList,
  }) {
    return fetchOffersList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchOffersList value)? fetchOffersList,
  }) {
    return fetchOffersList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchOffersList value)? fetchOffersList,
    required TResult orElse(),
  }) {
    if (fetchOffersList != null) {
      return fetchOffersList(this);
    }
    return orElse();
  }
}

abstract class _FetchOffersList implements OffersListEvent {
  const factory _FetchOffersList() = _$FetchOffersListImpl;
}

/// @nodoc
mixin _$OffersListState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  OffersList get offersList => throw _privateConstructorUsedError;
  Option<Either<MainFailure, OffersList>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of OffersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OffersListStateCopyWith<OffersListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersListStateCopyWith<$Res> {
  factory $OffersListStateCopyWith(
          OffersListState value, $Res Function(OffersListState) then) =
      _$OffersListStateCopyWithImpl<$Res, OffersListState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      OffersList offersList,
      Option<Either<MainFailure, OffersList>> successorFailure});
}

/// @nodoc
class _$OffersListStateCopyWithImpl<$Res, $Val extends OffersListState>
    implements $OffersListStateCopyWith<$Res> {
  _$OffersListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OffersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? offersList = null,
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
      offersList: null == offersList
          ? _value.offersList
          : offersList // ignore: cast_nullable_to_non_nullable
              as OffersList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, OffersList>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OffersListStateImplCopyWith<$Res>
    implements $OffersListStateCopyWith<$Res> {
  factory _$$OffersListStateImplCopyWith(_$OffersListStateImpl value,
          $Res Function(_$OffersListStateImpl) then) =
      __$$OffersListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      OffersList offersList,
      Option<Either<MainFailure, OffersList>> successorFailure});
}

/// @nodoc
class __$$OffersListStateImplCopyWithImpl<$Res>
    extends _$OffersListStateCopyWithImpl<$Res, _$OffersListStateImpl>
    implements _$$OffersListStateImplCopyWith<$Res> {
  __$$OffersListStateImplCopyWithImpl(
      _$OffersListStateImpl _value, $Res Function(_$OffersListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OffersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? offersList = null,
    Object? successorFailure = null,
  }) {
    return _then(_$OffersListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      offersList: null == offersList
          ? _value.offersList
          : offersList // ignore: cast_nullable_to_non_nullable
              as OffersList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, OffersList>>,
    ));
  }
}

/// @nodoc

class _$OffersListStateImpl implements _OffersListState {
  const _$OffersListStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.offersList,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final OffersList offersList;
  @override
  final Option<Either<MainFailure, OffersList>> successorFailure;

  @override
  String toString() {
    return 'OffersListState(isLoading: $isLoading, isError: $isError, offersList: $offersList, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.offersList, offersList) ||
                other.offersList == offersList) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, offersList, successorFailure);

  /// Create a copy of OffersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersListStateImplCopyWith<_$OffersListStateImpl> get copyWith =>
      __$$OffersListStateImplCopyWithImpl<_$OffersListStateImpl>(
          this, _$identity);
}

abstract class _OffersListState implements OffersListState {
  const factory _OffersListState(
      {required final bool isLoading,
      required final bool isError,
      required final OffersList offersList,
      required final Option<Either<MainFailure, OffersList>>
          successorFailure}) = _$OffersListStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  OffersList get offersList;
  @override
  Option<Either<MainFailure, OffersList>> get successorFailure;

  /// Create a copy of OffersListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OffersListStateImplCopyWith<_$OffersListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
