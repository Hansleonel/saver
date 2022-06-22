import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/constants.dart';

class SaverItemPlan extends StatelessWidget {
  final String iconItem;
  final String nameItem;
  final bool? isSelectedItem;
  final PlanBloc planBloc;
  const SaverItemPlan(
      {Key? key,
      required this.iconItem,
      required this.nameItem,
      required this.planBloc,
      this.isSelectedItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(iconItem);
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isSelectedItem! ? primaryColor : greyColor)),
            width: 104,
            height: 96,
            child: Column(
              children: [
                const SizedBox(height: 8),
                SvgPicture.asset(
                  "assets/icons/$iconItem.svg",
                  height: 48,
                ),
                const SizedBox(height: 8),
                Text(
                  nameItem,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        ),
        onTap: () {
          // TODO REFACTOR USE VALIDATIONS WITH ID
          if (nameItem == "Airpod") {
            planBloc.setItemSelected = 1;
          } else if (nameItem == "AirpodMax") {
            planBloc.setItemSelected = 2;
          } else if (nameItem == "Iphone") {
            planBloc.setItemSelected = 3;
          } else if (nameItem == "Android") {
            planBloc.setItemSelected = 4;
          } else if (nameItem == "Drone") {
            planBloc.setItemSelected = 5;
          } else if (nameItem == "Ipad") {
            planBloc.setItemSelected = 6;
          }
        });
  }
}
