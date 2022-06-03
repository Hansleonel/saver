import 'package:flutter/material.dart';

class CreditCards {
  CreditCards({this.creditCards});

  List<CreditCard>? creditCards;

  CreditCards.fromJson(Map<String, dynamic> json) {
    if (json['creditCards'] != null) {
      creditCards = <CreditCard>[];
      json['creditCards'].forEach((value) {
        creditCards!.add(CreditCard.fromJsonMap(value));
      });
    }
  }
}

class CreditCard {
  CreditCard({
    this.name,
    this.goal,
    this.number,
    this.icon,
    this.color,
  });

  String? uniqueId;
  String? name;
  String? goal;
  String? number;
  String? icon;
  int? color;

  CreditCard.fromJsonMap(Map<String, dynamic> jsonMap) {
    name = jsonMap['name'];
    goal = jsonMap['goal'];
    number = jsonMap['number'];
    icon = jsonMap['icon'];
    color = jsonMap['color'];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "goal": goal,
        "number": number,
        "icon": icon,
        "color": color,
      };

  String getIcon() {
    return 'assets/icons/$icon';
  }

  Color getColor() {
    return Color(color!);
  }
}
