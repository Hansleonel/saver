import 'package:flutter/material.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/widgets/widgets.dart';

class PlanPage extends StatelessWidget {
  PlanPage({Key? key}) : super(key: key);
  final planBloc = PlanBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select your plan',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your goal",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: defaultPadding),
                StreamBuilder<int>(
                    stream: planBloc.itemSelected,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data! > 0) {
                        print('column 1');
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SaverItemPlan(
                                  iconItem: "Airpod",
                                  nameItem: 'Airpod',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 1),
                                ),
                                SaverItemPlan(
                                  iconItem: "AirpodMax",
                                  nameItem: 'AirpodMax',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 2),
                                ),
                                SaverItemPlan(
                                  iconItem: "Iwatch",
                                  nameItem: 'Iphone',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 3),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SaverItemPlan(
                                  iconItem: "Android",
                                  nameItem: 'Android',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 4),
                                ),
                                SaverItemPlan(
                                  iconItem: "Drone",
                                  nameItem: 'Drone',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 5),
                                ),
                                SaverItemPlan(
                                  iconItem: "Macbook",
                                  nameItem: 'Ipad',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 6),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaverItemPlan(
                                iconItem: "Airpod",
                                nameItem: 'Airpod',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                iconItem: "AirpodMax",
                                nameItem: 'AirpodMax',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                iconItem: "Iwatch",
                                nameItem: 'Iphone',
                                planBloc: planBloc,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaverItemPlan(
                                iconItem: "Android",
                                nameItem: 'Android',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                iconItem: "Drone",
                                nameItem: 'Drone',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                iconItem: "Macbook",
                                nameItem: 'Ipad',
                                planBloc: planBloc,
                              )
                            ],
                          ),
                          StreamBuilder<bool>(
                              stream: planBloc.errorSelected,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data!) {
                                  return const Text(
                                    'You need choose a goal or write a mount to continue',
                                    style: TextStyle(color: errorColor),
                                  );
                                }
                                return const SizedBox();
                              })
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
        child: ElevatedButton(
            onPressed: () {
              if (planBloc.itemSelected.hasValue &&
                  planBloc.itemSelected.value >= 1) {
                print("Correct");
              } else {
                print("need choose an option");
                planBloc.setErrorSelected = true;
              }
            },
            child: const Text('Continue')),
      ),
    );
  }
}
