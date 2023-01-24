import 'package:work_with_all_blocks/data/models/card_model/colors_model.dart';

class CardDate {
  int id;
  String cardType;
  String cardNumber;
  String bankName;
  double moneyAmount;
  String cardCurrency;
  String expireDate;
  String iconImage;
  ColorsModel colors;

  CardDate({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.bankName,
    required this.moneyAmount,
    required this.cardCurrency,
    required this.expireDate,
    required this.iconImage,
    required this.colors,
  });

  factory CardDate.fromJson(Map<String, dynamic> json) {
    return CardDate(
      id: json["id"] as int? ?? 0,
      cardType: json['card_type'] as String? ?? "",
      cardNumber: json['card_number'] as String? ?? "",
      bankName: json['bank_name'] as String? ?? "",
      moneyAmount: json['money_amount'] as double? ?? 0.0,
      cardCurrency: json['card_currency'] as String? ?? "",
      expireDate: json['expire_date'] as String? ?? "",
      iconImage: json['icon_image'] as String? ?? "",
      colors: ColorsModel.fromJson(json['colors']),
    );
  }

  CardDate copyWith({
    int? id,
    String? cardType,
    String? cardNumber,
    String? bankName,
    double? moneyAmount,
    String? cardCurrency,
    String? expireDate,
    String? iconImage,
    ColorsModel? colors,
  }) {
    return CardDate(
      id: id ?? this.id,
      cardType: cardType ?? this.cardType,
      cardNumber: cardNumber ?? this.cardNumber,
      bankName: bankName ?? this.bankName,
      moneyAmount: moneyAmount ?? this.moneyAmount,
      cardCurrency: cardCurrency ?? this.cardCurrency,
      expireDate: expireDate ?? this.expireDate,
      iconImage: iconImage ?? this.iconImage,
      colors: colors ?? this.colors,
    );
  }
}
