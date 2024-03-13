// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(String error) firebaseError,
    required TResult Function() generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? networkError,
    TResult? Function(String error)? firebaseError,
    TResult? Function()? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(String error)? firebaseError,
    TResult Function()? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_FirebaseError value) firebaseError,
    required TResult Function(_General value) generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_FirebaseError value)? firebaseError,
    TResult? Function(_General value)? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_FirebaseError value)? firebaseError,
    TResult Function(_General value)? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkErrorImpl implements _NetworkError {
  const _$NetworkErrorImpl();

  @override
  String toString() {
    return 'Failure.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(String error) firebaseError,
    required TResult Function() generalError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? networkError,
    TResult? Function(String error)? firebaseError,
    TResult? Function()? generalError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(String error)? firebaseError,
    TResult Function()? generalError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_FirebaseError value) firebaseError,
    required TResult Function(_General value) generalError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_FirebaseError value)? firebaseError,
    TResult? Function(_General value)? generalError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_FirebaseError value)? firebaseError,
    TResult Function(_General value)? generalError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements Failure {
  const factory _NetworkError() = _$NetworkErrorImpl;
}

/// @nodoc
abstract class _$$FirebaseErrorImplCopyWith<$Res> {
  factory _$$FirebaseErrorImplCopyWith(
          _$FirebaseErrorImpl value, $Res Function(_$FirebaseErrorImpl) then) =
      __$$FirebaseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FirebaseErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirebaseErrorImpl>
    implements _$$FirebaseErrorImplCopyWith<$Res> {
  __$$FirebaseErrorImplCopyWithImpl(
      _$FirebaseErrorImpl _value, $Res Function(_$FirebaseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FirebaseErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseErrorImpl implements _FirebaseError {
  const _$FirebaseErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.firebaseError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      __$$FirebaseErrorImplCopyWithImpl<_$FirebaseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(String error) firebaseError,
    required TResult Function() generalError,
  }) {
    return firebaseError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? networkError,
    TResult? Function(String error)? firebaseError,
    TResult? Function()? generalError,
  }) {
    return firebaseError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(String error)? firebaseError,
    TResult Function()? generalError,
    required TResult orElse(),
  }) {
    if (firebaseError != null) {
      return firebaseError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_FirebaseError value) firebaseError,
    required TResult Function(_General value) generalError,
  }) {
    return firebaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_FirebaseError value)? firebaseError,
    TResult? Function(_General value)? generalError,
  }) {
    return firebaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_FirebaseError value)? firebaseError,
    TResult Function(_General value)? generalError,
    required TResult orElse(),
  }) {
    if (firebaseError != null) {
      return firebaseError(this);
    }
    return orElse();
  }
}

abstract class _FirebaseError implements Failure {
  const factory _FirebaseError(final String error) = _$FirebaseErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneralImplCopyWith<$Res> {
  factory _$$GeneralImplCopyWith(
          _$GeneralImpl value, $Res Function(_$GeneralImpl) then) =
      __$$GeneralImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneralImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GeneralImpl>
    implements _$$GeneralImplCopyWith<$Res> {
  __$$GeneralImplCopyWithImpl(
      _$GeneralImpl _value, $Res Function(_$GeneralImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GeneralImpl implements _General {
  const _$GeneralImpl();

  @override
  String toString() {
    return 'Failure.generalError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeneralImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(String error) firebaseError,
    required TResult Function() generalError,
  }) {
    return generalError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? networkError,
    TResult? Function(String error)? firebaseError,
    TResult? Function()? generalError,
  }) {
    return generalError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(String error)? firebaseError,
    TResult Function()? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_FirebaseError value) firebaseError,
    required TResult Function(_General value) generalError,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_FirebaseError value)? firebaseError,
    TResult? Function(_General value)? generalError,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_FirebaseError value)? firebaseError,
    TResult Function(_General value)? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class _General implements Failure {
  const factory _General() = _$GeneralImpl;
}
