class TransferFromModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TransferFromModel({
    this.amount,
    this.pin,
    this.sendTo,
  });

  TransferFromModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      TransferFromModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
      );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'pin': pin,
    'send_to': sendTo,
  };
}
