import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  String id;
  String name;
  String type;
  String description;
  num amount;
  DateTime createdAt;
  DateTime updatedAt;
  Wallet({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        amount: json["amount"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "amount": amount,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        type,
        amount,
        description,
        createdAt,
        updatedAt,
      ];
}
