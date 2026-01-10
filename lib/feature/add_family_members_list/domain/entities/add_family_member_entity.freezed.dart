// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_family_member_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddFamilyMemberEntity {
  bool get status => throw _privateConstructorUsedError;
  AddFamilyMemberDataEntity get data => throw _privateConstructorUsedError;

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFamilyMemberEntityCopyWith<AddFamilyMemberEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFamilyMemberEntityCopyWith<$Res> {
  factory $AddFamilyMemberEntityCopyWith(
    AddFamilyMemberEntity value,
    $Res Function(AddFamilyMemberEntity) then,
  ) = _$AddFamilyMemberEntityCopyWithImpl<$Res, AddFamilyMemberEntity>;
  @useResult
  $Res call({bool status, AddFamilyMemberDataEntity data});

  $AddFamilyMemberDataEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$AddFamilyMemberEntityCopyWithImpl<
  $Res,
  $Val extends AddFamilyMemberEntity
>
    implements $AddFamilyMemberEntityCopyWith<$Res> {
  _$AddFamilyMemberEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? data = null}) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as AddFamilyMemberDataEntity,
          )
          as $Val,
    );
  }

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddFamilyMemberDataEntityCopyWith<$Res> get data {
    return $AddFamilyMemberDataEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddFamilyMemberEntityImplCopyWith<$Res>
    implements $AddFamilyMemberEntityCopyWith<$Res> {
  factory _$$AddFamilyMemberEntityImplCopyWith(
    _$AddFamilyMemberEntityImpl value,
    $Res Function(_$AddFamilyMemberEntityImpl) then,
  ) = __$$AddFamilyMemberEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, AddFamilyMemberDataEntity data});

  @override
  $AddFamilyMemberDataEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddFamilyMemberEntityImplCopyWithImpl<$Res>
    extends
        _$AddFamilyMemberEntityCopyWithImpl<$Res, _$AddFamilyMemberEntityImpl>
    implements _$$AddFamilyMemberEntityImplCopyWith<$Res> {
  __$$AddFamilyMemberEntityImplCopyWithImpl(
    _$AddFamilyMemberEntityImpl _value,
    $Res Function(_$AddFamilyMemberEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? data = null}) {
    return _then(
      _$AddFamilyMemberEntityImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as AddFamilyMemberDataEntity,
      ),
    );
  }
}

/// @nodoc

class _$AddFamilyMemberEntityImpl implements _AddFamilyMemberEntity {
  const _$AddFamilyMemberEntityImpl({required this.status, required this.data});

  @override
  final bool status;
  @override
  final AddFamilyMemberDataEntity data;

  @override
  String toString() {
    return 'AddFamilyMemberEntity(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFamilyMemberEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFamilyMemberEntityImplCopyWith<_$AddFamilyMemberEntityImpl>
  get copyWith =>
      __$$AddFamilyMemberEntityImplCopyWithImpl<_$AddFamilyMemberEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _AddFamilyMemberEntity implements AddFamilyMemberEntity {
  const factory _AddFamilyMemberEntity({
    required final bool status,
    required final AddFamilyMemberDataEntity data,
  }) = _$AddFamilyMemberEntityImpl;

  @override
  bool get status;
  @override
  AddFamilyMemberDataEntity get data;

  /// Create a copy of AddFamilyMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFamilyMemberEntityImplCopyWith<_$AddFamilyMemberEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddFamilyMemberDataEntity {
  int get detailId => throw _privateConstructorUsedError;

  /// Create a copy of AddFamilyMemberDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFamilyMemberDataEntityCopyWith<AddFamilyMemberDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFamilyMemberDataEntityCopyWith<$Res> {
  factory $AddFamilyMemberDataEntityCopyWith(
    AddFamilyMemberDataEntity value,
    $Res Function(AddFamilyMemberDataEntity) then,
  ) = _$AddFamilyMemberDataEntityCopyWithImpl<$Res, AddFamilyMemberDataEntity>;
  @useResult
  $Res call({int detailId});
}

/// @nodoc
class _$AddFamilyMemberDataEntityCopyWithImpl<
  $Res,
  $Val extends AddFamilyMemberDataEntity
>
    implements $AddFamilyMemberDataEntityCopyWith<$Res> {
  _$AddFamilyMemberDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFamilyMemberDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detailId = null}) {
    return _then(
      _value.copyWith(
            detailId: null == detailId
                ? _value.detailId
                : detailId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddFamilyMemberDataEntityImplCopyWith<$Res>
    implements $AddFamilyMemberDataEntityCopyWith<$Res> {
  factory _$$AddFamilyMemberDataEntityImplCopyWith(
    _$AddFamilyMemberDataEntityImpl value,
    $Res Function(_$AddFamilyMemberDataEntityImpl) then,
  ) = __$$AddFamilyMemberDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int detailId});
}

/// @nodoc
class __$$AddFamilyMemberDataEntityImplCopyWithImpl<$Res>
    extends
        _$AddFamilyMemberDataEntityCopyWithImpl<
          $Res,
          _$AddFamilyMemberDataEntityImpl
        >
    implements _$$AddFamilyMemberDataEntityImplCopyWith<$Res> {
  __$$AddFamilyMemberDataEntityImplCopyWithImpl(
    _$AddFamilyMemberDataEntityImpl _value,
    $Res Function(_$AddFamilyMemberDataEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddFamilyMemberDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detailId = null}) {
    return _then(
      _$AddFamilyMemberDataEntityImpl(
        detailId: null == detailId
            ? _value.detailId
            : detailId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$AddFamilyMemberDataEntityImpl implements _AddFamilyMemberDataEntity {
  const _$AddFamilyMemberDataEntityImpl({required this.detailId});

  @override
  final int detailId;

  @override
  String toString() {
    return 'AddFamilyMemberDataEntity(detailId: $detailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFamilyMemberDataEntityImpl &&
            (identical(other.detailId, detailId) ||
                other.detailId == detailId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailId);

  /// Create a copy of AddFamilyMemberDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFamilyMemberDataEntityImplCopyWith<_$AddFamilyMemberDataEntityImpl>
  get copyWith =>
      __$$AddFamilyMemberDataEntityImplCopyWithImpl<
        _$AddFamilyMemberDataEntityImpl
      >(this, _$identity);
}

abstract class _AddFamilyMemberDataEntity implements AddFamilyMemberDataEntity {
  const factory _AddFamilyMemberDataEntity({required final int detailId}) =
      _$AddFamilyMemberDataEntityImpl;

  @override
  int get detailId;

  /// Create a copy of AddFamilyMemberDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFamilyMemberDataEntityImplCopyWith<_$AddFamilyMemberDataEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
