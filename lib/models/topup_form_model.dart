class TopupFromModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopupFromModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopupFromModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopupFromModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethodCode,
      };
}
