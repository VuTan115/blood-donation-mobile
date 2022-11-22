import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;
import 'package:personal_financial_management/domain/repositories/transaction_repo.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  final TransactionRepository _transactionRepository = TransactionRepository();
  void getWalletTransactions(
    String walletId,
  ) async {
    List<t.Transaction> walletTransactions = await _transactionRepository
        .getWalletTransactions('62850f110946e496d4fba97f');
    emit(WalletState(walletTransitions: walletTransactions));
  }
}
