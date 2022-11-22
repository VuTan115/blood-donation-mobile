part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  const WalletState({
    this.walletTransitions = const [],
  });
  final List<t.Transaction> walletTransitions;

  WalletState copyWith({
    List<t.Transaction> walletTransitions = const [],
  }) {
    return WalletState(
      walletTransitions: walletTransitions,
    );
  }

  @override
  List<Object> get props => [walletTransitions];
}

class WalletInitial extends WalletState {}
