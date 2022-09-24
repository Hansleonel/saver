import 'package:flutter/material.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/widgets/widgets.dart';

class PlanPageSecond extends StatelessWidget {
  static const route = 'planSecond';
  PlanPageSecond({Key? key}) : super(key: key);
  // you dont need inject the dependecy of the bloc planBloc becasuse within this bloc
  // we don't have a use case
  final planBloc = PlanBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select your goal',
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
                                  idItem: 1,
                                  iconItem: "Airpod",
                                  nameItem: 'Airpod',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 1),
                                ),
                                SaverItemPlan(
                                  idItem: 2,
                                  iconItem: "AirpodMax",
                                  nameItem: 'AirpodMax',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 2),
                                ),
                                SaverItemPlan(
                                  idItem: 3,
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
                                  idItem: 4,
                                  iconItem: "Android",
                                  nameItem: 'Android',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 4),
                                ),
                                SaverItemPlan(
                                  idItem: 5,
                                  iconItem: "Drone",
                                  nameItem: 'Drone',
                                  planBloc: planBloc,
                                  isSelectedItem: (snapshot.data == 5),
                                ),
                                SaverItemPlan(
                                  idItem: 6,
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
                                idItem: 1,
                                iconItem: "Airpod",
                                nameItem: 'Airpod',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                idItem: 2,
                                iconItem: "AirpodMax",
                                nameItem: 'AirpodMax',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                idItem: 3,
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
                                idItem: 4,
                                iconItem: "Android",
                                nameItem: 'Android',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                idItem: 5,
                                iconItem: "Drone",
                                nameItem: 'Drone',
                                planBloc: planBloc,
                              ),
                              SaverItemPlan(
                                idItem: 6,
                                iconItem: "Macbook",
                                nameItem: 'Ipad',
                                planBloc: planBloc,
                              )
                            ],
                          ),
                          StreamBuilder<bool>(
                              stream: planBloc.errorItemSelected,
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
                planBloc.setErrorItemSelected = true;
              }
            },
            child: const Text('Continue')),
      ),
    );
  }
}
