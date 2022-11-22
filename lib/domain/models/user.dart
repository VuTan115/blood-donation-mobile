import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String uid;
  final String name;
  final String? email;
  final String password;
  final String phone;
  final String? address;
  final String role;
  final String createdAt;
  final String status;
  final String refreshToken;
  const MyUser({
    required this.uid,
    required this.name,
    this.email,
    required this.password,
    required this.phone,
    this.address,
    required this.role,
    required this.createdAt,
    required this.status,
    required this.refreshToken,
  });
  //copyWith user
  static MyUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? address,
    String? role,
    String? createdAt,
    String? status,
    String? refreshToken,
  }) {
    return MyUser(
      uid: uid ?? '',
      name: name ?? '',
      email: email ?? '',
      password: password ?? '',
      phone: phone ?? '',
      address: address ?? '',
      role: role ?? '',
      createdAt: createdAt ?? '',
      status: status ?? '',
      refreshToken: refreshToken ?? '',
    );
  }

  // empty constructor
  static const empty = MyUser(
    uid: '',
    name: '',
    email: '',
    password: '',
    phone: '',
    address: '',
    role: '',
    createdAt: '',
    status: '',
    refreshToken: '',
  );
  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        address: json["address"],
        role: json["role"],
        createdAt: json["created_at"],
        status: json["status"],
        refreshToken: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
        "role": role,
        "created_at": createdAt,
        "status": status,
        "token": refreshToken,
      };
  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        password,
        phone,
        address,
        role,
        createdAt,
        status,
        refreshToken,
      ];
}
