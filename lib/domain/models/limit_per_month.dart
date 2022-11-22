import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LimitPerMonth extends Equatable {
  int amount;
  Timestamp month;
  var categoryRef;
  var userRef;

  LimitPerMonth({
    required this.amount,
    required this.month,
    required this.categoryRef,
    required this.userRef,
  });
  factory LimitPerMonth.fromSnapshot(DocumentSnapshot snapshot) {
    final limit =
        LimitPerMonth.fromJson(snapshot.data() as Map<String, dynamic>);
    return limit;
  }
  factory LimitPerMonth.fromJson(Map<String, dynamic> json) => LimitPerMonth(
        amount: json["amount"],
        month: json["month"],
        categoryRef: json["categoryRef"],
        userRef: json["userRef"],
      );
  Map<String, dynamic> toJson() => {
        "amount": amount,
        "month": month,
        "categoryRef": categoryRef,
        "userRef": userRef,
      };
  @override
  List<Object?> get props => [
        amount,
        month,
        categoryRef,
        userRef,
      ];
}
