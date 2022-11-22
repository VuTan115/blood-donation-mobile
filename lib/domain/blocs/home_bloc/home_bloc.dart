import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;
import 'package:personal_financial_management/domain/models/wallet.dart';
import 'package:personal_financial_management/domain/repositories/budget_repo.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TransactionRepository transactionRepository,
    required BudgetRepository budgetRepository,
    required WalletRepository walletRepository,
  })  : _transactionRepository = transactionRepository,
        _budgetRepository = budgetRepository,
        _walletRepository = walletRepository,
        super(const HomeState()) {
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
    on<HomeSubscriptionRequestedWithFilter>(_onDateChange);
  }

  final TransactionRepository _transactionRepository;
  final BudgetRepository _budgetRepository;
  final WalletRepository _walletRepository;

  void _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: () => HomeStatus.loading));
      List<t.Transaction> transactions = await _transactionRepository
          .getTransactions(DateTime.now(), state.filter);
      List<t.Transaction> todayTransactions = await _transactionRepository
          .getTransactions(DateTime.now(), TransactionFilter.day);
      List<t.Transaction> weekTransactions = await _transactionRepository
          .getTransactions(DateTime.now(), TransactionFilter.week);
      List<t.Transaction> monthTransactions = await _transactionRepository
          .getTransactions(DateTime.now(), TransactionFilter.month);
      todayTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      weekTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      monthTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      Map<String, dynamic> allWallets = await _walletRepository.getAllWallets();

      Map<String, List<t.Transaction>>? transactionMap = {
        "day": todayTransactions,
        "week": weekTransactions,
        "month": monthTransactions,
      };
      List<t.Transaction> allTransactions =
          await _transactionRepository.getAllTransactions();
      Map<String, dynamic> budget =
          await _budgetRepository.getMonthlyBudget(DateTime.now());
      allTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      transactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      emit(state.copyWith(
        status: () => HomeStatus.success,
        transactions: () => transactions,
        totalBudget: () => budget["totalBudget"],
        allTransactions: () => allTransactions,
        allWallets: allWallets,
        transactionMap: transactionMap,
        spent: () => budget["spent"],
      ));
    } catch (e) {
      print(e);
    }
  }

  void _onDateChange(
    HomeSubscriptionRequestedWithFilter event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: () => HomeStatus.loading));
      Map<String, List<t.Transaction>>? curTransactionMap =
          state.transactionMap;

      if (event.filter == TransactionFilter.day) {
        List<t.Transaction> todayTransactions = await _transactionRepository
            .getTransactions(event.date, TransactionFilter.day);
        todayTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        curTransactionMap!["day"] = todayTransactions;
      }
      if (event.filter == TransactionFilter.week) {
        List<t.Transaction> weekTransactions = await _transactionRepository
            .getTransactions(event.date, TransactionFilter.week);
        weekTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        curTransactionMap!["week"] = weekTransactions;
      }
      Map<String, dynamic> budget = {
        "totalBudget": state.totalBudget,
        "spent": state.spent
      };
      if (event.filter == TransactionFilter.month) {
        List<t.Transaction> monthTransactions = await _transactionRepository
            .getTransactions(event.date, TransactionFilter.month);
        monthTransactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        curTransactionMap!["month"] = monthTransactions;
        budget = await _budgetRepository.getMonthlyBudget(event.date);
      }
      print(budget);
      emit(state.copyWith(
        status: () => HomeStatus.success,
        totalBudget: () => budget["totalBudget"],
        transactionMap: curTransactionMap,
        spent: () => budget["spent"],
      ));
    } catch (e) {
      print(e);
    }
  }
}
