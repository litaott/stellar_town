// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'User.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'User';

  static int _$id(User v) => v.id;
  static const Field<User, int> _f$id = Field('id', _$id, opt: true, def: 0);
  static String _$username(User v) => v.username;
  static const Field<User, String> _f$username =
      Field('username', _$username, opt: true, def: '未知');
  static String _$password(User v) => v.password;
  static const Field<User, String> _f$password =
      Field('password', _$password, opt: true, def: '未知');
  static String _$phoneNumber(User v) => v.phoneNumber;
  static const Field<User, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true, def: '未填写');
  static String _$avatar(User v) => v.avatar;
  static const Field<User, String> _f$avatar =
      Field('avatar', _$avatar, opt: true, def: ConstUrl.defaultAvatar);
  static String _$address(User v) => v.address;
  static const Field<User, String> _f$address =
      Field('address', _$address, opt: true, def: '武汉');
  static int _$gender(User v) => v.gender;
  static const Field<User, int> _f$gender =
      Field('gender', _$gender, opt: true, def: 2);
  static int _$age(User v) => v.age;
  static const Field<User, int> _f$age = Field('age', _$age, opt: true, def: 0);
  static String _$signature(User v) => v.signature;
  static const Field<User, String> _f$signature =
      Field('signature', _$signature, opt: true, def: '快来书写你的个性签名吧！');
  static String _$followNumber(User v) => v.followNumber;
  static const Field<User, String> _f$followNumber =
      Field('followNumber', _$followNumber, opt: true, def: '0');
  static String _$fansNumber(User v) => v.fansNumber;
  static const Field<User, String> _f$fansNumber =
      Field('fansNumber', _$fansNumber, opt: true, def: '0');

  @override
  final Map<Symbol, Field<User, dynamic>> fields = const {
    #id: _f$id,
    #username: _f$username,
    #password: _f$password,
    #phoneNumber: _f$phoneNumber,
    #avatar: _f$avatar,
    #address: _f$address,
    #gender: _f$gender,
    #age: _f$age,
    #signature: _f$signature,
    #followNumber: _f$followNumber,
    #fansNumber: _f$fansNumber,
  };

  static User _instantiate(DecodingData data) {
    return User(
        id: data.dec(_f$id),
        username: data.dec(_f$username),
        password: data.dec(_f$password),
        phoneNumber: data.dec(_f$phoneNumber),
        avatar: data.dec(_f$avatar),
        address: data.dec(_f$address),
        gender: data.dec(_f$gender),
        age: data.dec(_f$age),
        signature: data.dec(_f$signature),
        followNumber: data.dec(_f$followNumber),
        fansNumber: data.dec(_f$fansNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<User>(map));
  }

  static User fromJson(String json) {
    return _guard((c) => c.fromJson<User>(json));
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper._guard((c) => c.toJson(this as User));
  }

  Map<String, dynamic> toMap() {
    return UserMapper._guard((c) => c.toMap(this as User));
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UserMapper._guard((c) => c.hash(this));
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? username,
      String? password,
      String? phoneNumber,
      String? avatar,
      String? address,
      int? gender,
      int? age,
      String? signature,
      String? followNumber,
      String? fansNumber});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? username,
          String? password,
          String? phoneNumber,
          String? avatar,
          String? address,
          int? gender,
          int? age,
          String? signature,
          String? followNumber,
          String? fansNumber}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (username != null) #username: username,
        if (password != null) #password: password,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (avatar != null) #avatar: avatar,
        if (address != null) #address: address,
        if (gender != null) #gender: gender,
        if (age != null) #age: age,
        if (signature != null) #signature: signature,
        if (followNumber != null) #followNumber: followNumber,
        if (fansNumber != null) #fansNumber: fansNumber
      }));
  @override
  User $make(CopyWithData data) => User(
      id: data.get(#id, or: $value.id),
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      avatar: data.get(#avatar, or: $value.avatar),
      address: data.get(#address, or: $value.address),
      gender: data.get(#gender, or: $value.gender),
      age: data.get(#age, or: $value.age),
      signature: data.get(#signature, or: $value.signature),
      followNumber: data.get(#followNumber, or: $value.followNumber),
      fansNumber: data.get(#fansNumber, or: $value.fansNumber));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl($value, $cast, t);
}
