// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_store_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangeStoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String storeId) changeMyStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? changeMyStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? changeMyStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeMyStore value) changeMyStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeMyStore value)? changeMyStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeMyStore value)? changeMyStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeStoreEventCopyWith<$Res> {
  factory $ChangeStoreEventCopyWith(
          ChangeStoreEvent value, $Res Function(ChangeStoreEvent) then) =
      _$ChangeStoreEventCopyWithImpl<$Res, ChangeStoreEvent>;
}

/// @nodoc
class _$ChangeStoreEventCopyWithImpl<$Res, $Val extends ChangeStoreEvent>
    implements $ChangeStoreEventCopyWith<$Res> {
  _$ChangeStoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeStoreEvent
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
    extends _$ChangeStoreEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeStoreEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ChangeStoreEvent.started()';
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
    required TResult Function(String storeId) changeMyStore,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? changeMyStore,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? changeMyStore,
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
    required TResult Function(_ChangeMyStore value) changeMyStore,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeMyStore value)? changeMyStore,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeMyStore value)? changeMyStore,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ChangeStoreEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeMyStoreImplCopyWith<$Res> {
  factory _$$ChangeMyStoreImplCopyWith(
          _$ChangeMyStoreImpl value, $Res Function(_$ChangeMyStoreImpl) then) =
      __$$ChangeMyStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String storeId});
}

/// @nodoc
class __$$ChangeMyStoreImplCopyWithImpl<$Res>
    extends _$ChangeStoreEventCopyWithImpl<$Res, _$ChangeMyStoreImpl>
    implements _$$ChangeMyStoreImplCopyWith<$Res> {
  __$$ChangeMyStoreImplCopyWithImpl(
      _$ChangeMyStoreImpl _value, $Res Function(_$ChangeMyStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeStoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$ChangeMyStoreImpl(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeMyStoreImpl implements _ChangeMyStore {
  const _$ChangeMyStoreImpl({required this.storeId});

  @override
  final String storeId;

  @override
  String toString() {
    return 'ChangeStoreEvent.changeMyStore(storeId: $storeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeMyStoreImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  /// Create a copy of ChangeStoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeMyStoreImplCopyWith<_$ChangeMyStoreImpl> get copyWith =>
      __$$ChangeMyStoreImplCopyWithImpl<_$ChangeMyStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String storeId) changeMyStore,
  }) {
    return changeMyStore(storeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String storeId)? changeMyStore,
  }) {
    return changeMyStore?.call(storeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String storeId)? changeMyStore,
    required TResult orElse(),
  }) {
    if (changeMyStore != null) {
      return changeMyStore(storeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeMyStore value) changeMyStore,
  }) {
    return changeMyStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeMyStore value)? changeMyStore,
  }) {
    return changeMyStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeMyStore value)? changeMyStore,
    required TResult orElse(),
  }) {
    if (changeMyStore != null) {
      return changeMyStore(this);
    }
    return orElse();
  }
}

abstract class _ChangeMyStore implements ChangeStoreEvent {
  const factory _ChangeMyStore({required final String storeId}) =
      _$ChangeMyStoreImpl;

  String get storeId;

  /// Create a copy of ChangeStoreEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeMyStoreImplCopyWith<_$ChangeMyStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChangeStoreState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  ChangeStore get changeStore => throw _privateConstructorUsedError;
  Option<Either<MainFailure, ChangeStore>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChangeStoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeStoreStateCopyWith<ChangeStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeStoreStateCopyWith<$Res> {
  factory $ChangeStoreStateCopyWith(
          ChangeStoreState value, $Res Function(ChangeStoreState) then) =
      _$ChangeStoreStateCopyWithImpl<$Res, ChangeStoreState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      ChangeStore changeStore,
      Option<Either<MainFailure, ChangeStore>> successorFailure});
}

/// @nodoc
class _$ChangeStoreStateCopyWithImpl<$Res, $Val extends ChangeStoreState>
    implements $ChangeStoreStateCopyWith<$Res> {
  _$ChangeStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeStoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? changeStore = null,
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
      changeStore: null == changeStore
          ? _value.changeStore
          : changeStore // ignore: cast_nullable_to_non_nullable
              as ChangeStore,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, ChangeStore>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeStoreStateImplCopyWith<$Res>
    implements $ChangeStoreStateCopyWith<$Res> {
  factory _$$ChangeStoreStateImplCopyWith(_$ChangeStoreStateImpl value,
          $Res Function(_$ChangeStoreStateImpl) then) =
      __$$ChangeStoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      ChangeStore changeStore,
      Option<Either<MainFailure, ChangeStore>> successorFailure});
}

/// @nodoc
class __$$ChangeStoreStateImplCopyWithImpl<$Res>
    extends _$ChangeStoreStateCopyWithImpl<$Res, _$ChangeStoreStateImpl>
    implements _$$ChangeStoreStateImplCopyWith<$Res> {
  __$$ChangeStoreStateImplCopyWithImpl(_$ChangeStoreStateImpl _value,
      $Res Function(_$ChangeStoreStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeStoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? changeStore = null,
    Object? successorFailure = null,
  }) {
    return _then(_$ChangeStoreStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      changeStore: null == changeStore
          ? _value.changeStore
          : changeStore // ignore: cast_nullable_to_non_nullable
              as ChangeStore,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, ChangeStore>>,
    ));
  }
}

/// @nodoc

class _$ChangeStoreStateImpl implements _ChangeStoreState {
  const _$ChangeStoreStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.changeStore,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final ChangeStore changeStore;
  @override
  final Option<Either<MainFailure, ChangeStore>> successorFailure;

  @override
  String toString() {
    return 'ChangeStoreState(isLoading: $isLoading, isError: $isError, changeStore: $changeStore, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStoreStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.changeStore, changeStore) ||
                other.changeStore == changeStore) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, changeStore, successorFailure);

  /// Create a copy of ChangeStoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStoreStateImplCopyWith<_$ChangeStoreStateImpl> get copyWith =>
      __$$ChangeStoreStateImplCopyWithImpl<_$ChangeStoreStateImpl>(
          this, _$identity);
}

abstract class _ChangeStoreState implements ChangeStoreState {
  const factory _ChangeStoreState(
      {required final bool isLoading,
      required final bool isError,
      required final ChangeStore changeStore,
      required final Option<Either<MainFailure, ChangeStore>>
          successorFailure}) = _$ChangeStoreStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  ChangeStore get changeStore;
  @override
  Option<Either<MainFailure, ChangeStore>> get successorFailure;

  /// Create a copy of ChangeStoreState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeStoreStateImplCopyWith<_$ChangeStoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
