import 'package:saver/models/credit_card.dart';

class BankBloc {
  Future<List<CreditCard>> getCreditCards() async {
    List<CreditCard> listCreditCard = [];
    CreditCard creditCard = CreditCard(
        name: 'Card Balance 01',
        goal: "\$4000.00",
        number: '**** 4555',
        icon: "Visaicon.svg",
        color: 0xFF7B61FF);
    CreditCard creditCard01 = CreditCard(
        name: 'Card Balance 02',
        goal: '\$4000.00 usd',
        number: '**** 4555',
        icon: "Visaicon.svg",
        color: 0xFF2ED573);
    CreditCard creditCard02 = CreditCard(
        name: 'Card Balance 03',
        goal: '4000.00 usd',
        number: '**** 4555',
        icon: "Visaicon.svg",
        color: 0xFFFFBE21);
    CreditCard creditCard03 = CreditCard(
        name: 'Card Balance 04',
        goal: '4000.00 usd',
        number: '**** 4555',
        icon: "Visaicon.svg",
        color: 0xFFEA5B5B);
    listCreditCard.add(creditCard);
    listCreditCard.add(creditCard01);
    listCreditCard.add(creditCard02);
    listCreditCard.add(creditCard03);
    return listCreditCard;
  }
}
