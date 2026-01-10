// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_family_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddFamilyMemberModel _$AddFamilyMemberModelFromJson(Map<String, dynamic> json) {
  return _AddFamilyMemberModel.fromJson(json);
}

/// @nodoc
mixin _$AddFamilyMemberModel {
  @JsonKey(name: "Status")
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this AddFamilyMemberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddFamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFamilyMemberModelCopyWith<AddFamilyMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFamilyMemberModelCopyWith<$Res> {
  factory $AddFamilyMemberModelCopyWith(
    AddFamilyMemberModel value,
    $Res Function(AddFamilyMemberModel) then,
  ) = _$AddFamilyMemberModelCopyWithImpl<$Res, AddFamilyMemberModel>;
  @useResult
  $Res call({
    @JsonKey(name: "Status") bool status,
    @JsonKey(name: "data") Data data,
  });

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$AddFamilyMemberModelCopyWithImpl<
  $Res,
  $Val extends AddFamilyMemberModel
>
    implements $AddFamilyMemberModelCopyWith<$Res> {
  _$AddFamilyMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFamilyMemberModel
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
                      as Data,
          )
          as $Val,
    );
  }

  /// Create a copy of AddFamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddFamilyMemberModelImplCopyWith<$Res>
    implements $AddFamilyMemberModelCopyWith<$Res> {
  factory _$$AddFamilyMemberModelImplCopyWith(
    _$AddFamilyMemberModelImpl value,
    $Res Function(_$AddFamilyMemberModelImpl) then,
  ) = __$$AddFamilyMemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "Status") bool status,
    @JsonKey(name: "data") Data data,
  });

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddFamilyMemberModelImplCopyWithImpl<$Res>
    extends _$AddFamilyMemberModelCopyWithImpl<$Res, _$AddFamilyMemberModelImpl>
    implements _$$AddFamilyMemberModelImplCopyWith<$Res> {
  __$$AddFamilyMemberModelImplCopyWithImpl(
    _$AddFamilyMemberModelImpl _value,
    $Res Function(_$AddFamilyMemberModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddFamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? data = null}) {
    return _then(
      _$AddFamilyMemberModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as Data,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddFamilyMemberModelImpl implements _AddFamilyMemberModel {
  const _$AddFamilyMemberModelImpl({
    @JsonKey(name: "Status") required this.status,
    @JsonKey(name: "data") required this.data,
  });

  factory _$AddFamilyMemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFamilyMemberModelImplFromJson(json);

  @override
  @JsonKey(name: "Status")
  final bool status;
  @override
  @JsonKey(name: "data")
  final Data data;

  @override
  String toString() {
    return 'AddFamilyMemberModel(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFamilyMemberModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of AddFamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFamilyMemberModelImplCopyWith<_$AddFamilyMemberModelImpl>
  get copyWith =>
      __$$AddFamilyMemberModelImplCopyWithImpl<_$AddFamilyMemberModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFamilyMemberModelImplToJson(this);
  }
}

abstract class _AddFamilyMemberModel implements AddFamilyMemberModel {
  const factory _AddFamilyMemberModel({
    @JsonKey(name: "Status") required final bool status,
    @JsonKey(name: "data") required final Data data,
  }) = _$AddFamilyMemberModelImpl;

  factory _AddFamilyMemberModel.fromJson(Map<String, dynamic> json) =
      _$AddFamilyMemberModelImpl.fromJson;

  @override
  @JsonKey(name: "Status")
  bool get status;
  @override
  @JsonKey(name: "data")
  Data get data;

  /// Create a copy of AddFamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFamilyMemberModelImplCopyWith<_$AddFamilyMemberModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "detail_id")
  int get detailId => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({@JsonKey(name: "detail_id") int detailId});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
    _$DataImpl value,
    $Res Function(_$DataImpl) then,
  ) = __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "detail_id") int detailId});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
    : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detailId = null}) {
    return _then(
      _$DataImpl(
        detailId: null == detailId
            ? _value.detailId
            : detailId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: "detail_id") required this.detailId});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "detail_id")
  final int detailId;

  @override
  String toString() {
    return 'Data(detailId: $detailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.detailId, detailId) ||
                other.detailId == detailId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, detailId);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data({
    @JsonKey(name: "detail_id") required final int detailId,
  }) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "detail_id")
  int get detailId;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
