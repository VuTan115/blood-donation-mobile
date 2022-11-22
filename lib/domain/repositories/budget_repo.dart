import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/app/utils/constances.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;

class BudgetRepository {
  Future<Map<String, dynamic>> getMonthlyBudget(DateTime month) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      Response<Map<String, dynamic>> res = await Dio().get(
          '$IPAddress/api/budget',
          options: Options(headers: {'AuthToken': token}),
          queryParameters: {'timestamp': month.toString()});
      Map<String, dynamic>? result = res.data;
      return result!;
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> getBudgetDetail(String type) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      Response<Map<String, dynamic>> res = await Dio().get(
          '$IPAddress/api/budget/detail',
          options: Options(headers: {'AuthToken': token}),
          queryParameters: {'is_output': type});
      Map<String, dynamic>? result = res.data;
      return result!;
    } catch (error) {
      throw error;
    }
  }

  Future<String> createCategoryBudget(
      DateTime timestamp, String category_id, num amount) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      Response<String> res = await Dio().post('$IPAddress/api/budget/category',
          options: Options(headers: {'AuthToken': token}),
          data: jsonEncode({
            "month": timestamp.toString(),
            "category_id": category_id,
            "amount": amount
          }));
      String? result = res.data;
      return result!;
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>> createTotalBudget(
      DateTime timestamp, num amount) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      Response<Map<String, dynamic>> res = await Dio().post(
          '$IPAddress/api/budget',
          options: Options(headers: {'AuthToken': token}),
          data: jsonEncode({"month": timestamp.toString(), "amount": amount}));
      Map<String, dynamic>? result = res.data;
      return result!;
    } catch (error) {
      throw error;
    }
  }
}
