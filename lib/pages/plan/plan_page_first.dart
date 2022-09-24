import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/pages/plan/plan_page_first_calculate.dart';
import 'package:saver/pages/plan/plan_page_second.dart';

class PlanPageFirst extends StatelessWidget {
  static const route = 'planFirst';
  PlanPageFirst({Key? key}) : super(key: key);
  final planBloc = PlanBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Plan',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<int>(
            stream: planBloc.planSelected,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data! > 0) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 160),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemFirstPagePlan(
                            idPlan: 1,
                            title: 'Amount of money',
                            icon: 'AirpodMax',
                            bloc: planBloc,
                            isSelectedItem: (snapshot.data == 1),
                          ),
                          ItemFirstPagePlan(
                            idPlan: 2,
                            title: 'Gift or Device',
                            icon: 'Drone',
                            bloc: planBloc,
                            isSelectedItem: (snapshot.data == 2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, right: 48),
                        child: Text(
                            snapshot.data == 1
                                ? 'Enter an amount and save it in the shortest amount of time possible with our tips'
                                : 'Select a device from our list and get it in the shortest possible time with your resources',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: primaryMaterialColor.shade900)),
                      )
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  const SizedBox(height: 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemFirstPagePlan(
                        idPlan: 1,
                        title: 'Amount of money',
                        icon: 'AirpodMax',
                        bloc: planBloc,
                      ),
                      ItemFirstPagePlan(
                        idPlan: 2,
                        title: 'Gift or Device',
                        icon: 'Drone',
                        bloc: planBloc,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  StreamBuilder<bool>(
                      stream: planBloc.errorPlanSelected,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!) {
                          return Text('Error, you need to select a plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: errorColor));
                        }
                        return Text('Choose your way to save money',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor));
                      })
                ],
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
        child: ElevatedButton(
            onPressed: () {
              if (planBloc.planSelected.hasValue &&
                  planBloc.planSelected.value >= 1) {
                planBloc.planSelected.value == 1
                    ? Navigator.pushNamed(context, PlanPageFirstCalculate.route)
                    : Navigator.pushNamed(context, PlanPageSecond.route);
              } else {
                planBloc.setErrorPlanSelected = true;
              }
            },
            child: const Text('CONTINUE')),
      ),
    );
  }
}

// TODO REFACTOR USE REUSABLE WIDGET
class ItemFirstPagePlan extends StatelessWidget {
  final int idPlan;
  final String title;
  final String icon;
  final PlanBloc bloc;
  final bool? isSelectedItem;
  const ItemFirstPagePlan({
    Key? key,
    required this.idPlan,
    required this.title,
    required this.icon,
    required this.bloc,
    this.isSelectedItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isSelectedItem! ? primaryColor : greyColor)),
          width: 144,
          height: 128,
          child: Column(
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                "assets/icons/$icon.svg",
                height: 64,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.button,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        if (idPlan == 1) {
          bloc.setPlanSelected = 1;
        } else if (idPlan == 2) {
          bloc.setPlanSelected = 2;
        }
      },
    );
  }
}
