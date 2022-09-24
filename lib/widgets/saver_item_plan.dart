import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/constants.dart';

class SaverItemPlan extends StatelessWidget {
  final int idItem;
  final String iconItem;
  final String nameItem;
  final bool? isSelectedItem;
  final PlanBloc planBloc;
  const SaverItemPlan(
      {Key? key,
      required this.idItem,
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
          if (idItem == 1) {
            planBloc.setItemSelected = 1;
          } else if (idItem == 2) {
            planBloc.setItemSelected = 2;
          } else if (idItem == 3) {
            planBloc.setItemSelected = 3;
          } else if (idItem == 4) {
            planBloc.setItemSelected = 4;
          } else if (idItem == 5) {
            planBloc.setItemSelected = 5;
          } else if (idItem == 6) {
            planBloc.setItemSelected = 6;
          }
        });
  }
}
