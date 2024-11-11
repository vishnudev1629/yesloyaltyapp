// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchUserDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchUserDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchUserDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchUserDetails value) fetchUserDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchUserDetails value)? fetchUserDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchUserDetails value)? fetchUserDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsEventCopyWith<$Res> {
  factory $UserDetailsEventCopyWith(
          UserDetailsEvent value, $Res Function(UserDetailsEvent) then) =
      _$UserDetailsEventCopyWithImpl<$Res, UserDetailsEvent>;
}

/// @nodoc
class _$UserDetailsEventCopyWithImpl<$Res, $Val extends UserDetailsEvent>
    implements $UserDetailsEventCopyWith<$Res> {
  _$UserDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailsEvent
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
    extends _$UserDetailsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserDetailsEvent.started()';
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
    required TResult Function() fetchUserDetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchUserDetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchUserDetails,
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
    required TResult Function(_FetchUserDetails value) fetchUserDetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchUserDetails value)? fetchUserDetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchUserDetails value)? fetchUserDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserDetailsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchUserDetailsImplCopyWith<$Res> {
  factory _$$FetchUserDetailsImplCopyWith(_$FetchUserDetailsImpl value,
          $Res Function(_$FetchUserDetailsImpl) then) =
      __$$FetchUserDetailsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsEventCopyWithImpl<$Res, _$FetchUserDetailsImpl>
    implements _$$FetchUserDetailsImplCopyWith<$Res> {
  __$$FetchUserDetailsImplCopyWithImpl(_$FetchUserDetailsImpl _value,
      $Res Function(_$FetchUserDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchUserDetailsImpl implements _FetchUserDetails {
  const _$FetchUserDetailsImpl();

  @override
  String toString() {
    return 'UserDetailsEvent.fetchUserDetails()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUserDetailsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchUserDetails,
  }) {
    return fetchUserDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchUserDetails,
  }) {
    return fetchUserDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchUserDetails,
    required TResult orElse(),
  }) {
    if (fetchUserDetails != null) {
      return fetchUserDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchUserDetails value) fetchUserDetails,
  }) {
    return fetchUserDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchUserDetails value)? fetchUserDetails,
  }) {
    return fetchUserDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchUserDetails value)? fetchUserDetails,
    required TResult orElse(),
  }) {
    if (fetchUserDetails != null) {
      return fetchUserDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchUserDetails implements UserDetailsEvent {
  const factory _FetchUserDetails() = _$FetchUserDetailsImpl;
}

/// @nodoc
mixin _$UserDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  UserDetails get userDetails => throw _privateConstructorUsedError;
  Option<Either<MainFailure, UserDetails>> get successorFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsStateCopyWith<UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsStateCopyWith<$Res> {
  factory $UserDetailsStateCopyWith(
          UserDetailsState value, $Res Function(UserDetailsState) then) =
      _$UserDetailsStateCopyWithImpl<$Res, UserDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      UserDetails userDetails,
      Option<Either<MainFailure, UserDetails>> successorFailure});
}

/// @nodoc
class _$UserDetailsStateCopyWithImpl<$Res, $Val extends UserDetailsState>
    implements $UserDetailsStateCopyWith<$Res> {
  _$UserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? userDetails = null,
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
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, UserDetails>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsStateImplCopyWith<$Res>
    implements $UserDetailsStateCopyWith<$Res> {
  factory _$$UserDetailsStateImplCopyWith(_$UserDetailsStateImpl value,
          $Res Function(_$UserDetailsStateImpl) then) =
      __$$UserDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      UserDetails userDetails,
      Option<Either<MainFailure, UserDetails>> successorFailure});
}

/// @nodoc
class __$$UserDetailsStateImplCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$UserDetailsStateImpl>
    implements _$$UserDetailsStateImplCopyWith<$Res> {
  __$$UserDetailsStateImplCopyWithImpl(_$UserDetailsStateImpl _value,
      $Res Function(_$UserDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? userDetails = null,
    Object? successorFailure = null,
  }) {
    return _then(_$UserDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, UserDetails>>,
    ));
  }
}

/// @nodoc

class _$UserDetailsStateImpl implements _UserDetailsState {
  const _$UserDetailsStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.userDetails,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final UserDetails userDetails;
  @override
  final Option<Either<MainFailure, UserDetails>> successorFailure;

  @override
  String toString() {
    return 'UserDetailsState(isLoading: $isLoading, isError: $isError, userDetails: $userDetails, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, userDetails, successorFailure);

  /// Create a copy of UserDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsStateImplCopyWith<_$UserDetailsStateImpl> get copyWith =>
      __$$UserDetailsStateImplCopyWithImpl<_$UserDetailsStateImpl>(
          this, _$identity);
}

abstract class _UserDetailsState implements UserDetailsState {
  const factory _UserDetailsState(
      {required final bool isLoading,
      required final bool isError,
      required final UserDetails userDetails,
      required final Option<Either<MainFailure, UserDetails>>
          successorFailure}) = _$UserDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  UserDetails get userDetails;
  @override
  Option<Either<MainFailure, UserDetails>> get successorFailure;

  /// Create a copy of UserDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsStateImplCopyWith<_$UserDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
