enum TransactionStrategy{
  POINT_PREFERRED,
  MONEY_ONLY;
}
extension TxStrategyExtends on TransactionStrategy{
  String get value{
    switch(this){
      case TransactionStrategy.MONEY_ONLY:
        return 'money-only';
      case TransactionStrategy.POINT_PREFERRED:
      default:
        return 'point-preferred';
    }
  }
}