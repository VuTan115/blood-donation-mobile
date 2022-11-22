import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  String? id;
  bool? is_output;
  int amount;

  String categoryName;
  DateTime createdAt;

  Transaction({
    this.id,
    this.is_output,
    required this.amount,
    required this.categoryName,
    required this.createdAt,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id: json["_id"],
        is_output: json["is_output"],
        amount: json["amount"],
        categoryName: json["category"][0]["name"],
        createdAt: DateTime.parse(json["created_at"]));
  }
  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "is_output": is_output,
  //       "amount": amount,
  //     };
  @override
  List<Object?> get props => [
        id,
        is_output,
        amount,
        categoryName,
        createdAt,
      ];
}
