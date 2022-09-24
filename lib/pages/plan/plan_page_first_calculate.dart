import 'package:flutter/material.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/constants.dart';
import 'package:saver/dependency_injections/injection.dart';
import 'package:saver/pages/register/register_page.dart';
import 'package:saver/widgets/widgets.dart';

class PlanPageFirstCalculate extends StatelessWidget {
  static const route = 'planFirstCalculate';
  PlanPageFirstCalculate({Key? key}) : super(key: key);

  final PlanBloc? planBloc = Provider.of<PlanBloc>(() => getIt.get<PlanBloc>());
  final TextEditingController mountTxtEditCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mount',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: StreamBuilder<bool>(
                  stream: planBloc!.hasPlanCalculate,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SaverInputField(
                            textEditingController: mountTxtEditCntrl,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            maxLength: 4,
                            errorText: "Enter a valid mount",
                            hintText: "Enter your mount",
                            prefixIcon: "assets/icons/Coupon.svg",
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'You will save',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                planBloc!.mountSaved.toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 48),
                              ),
                              Text(
                                '/usd',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          Text(
                            'in only ${planBloc!.dayToSave} Days',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2!,
                          )
                        ],
                      );
                    } else if (snapshot.hasData && snapshot.data! == false) {
                      return const SaverLoading(
                        textSaverLoading: 'Calulating your plan',
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SaverInputField(
                          textEditingController: mountTxtEditCntrl,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          maxLength: 4,
                          errorText: "Enter a valid mount",
                          hintText: "Enter your mount",
                          prefixIcon: "assets/icons/Coupon.svg",
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Enter an ammount, Your plan and days to save will be calculated based on your user mount',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: primaryMaterialColor.shade900),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: whileColor5),
                  onPressed: () async {
                    // TODO RECATOR TO use validations for only get numbers from TextEditinController
                    if (mountTxtEditCntrl.text.isNotEmpty) {
                      await planBloc!
                          .calculatePlanDays(int.parse(mountTxtEditCntrl.text));
                    }
                  },
                  child: const Text('CALCULATE YOUR PLAN'),
                ),
                const SizedBox(height: 16.0),
                StreamBuilder<bool>(
                    initialData: false,
                    stream: planBloc!.hasPlanCalculate,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: (snapshot.hasData && snapshot.data!)
                            ? () {
                                if (planBloc!.mountSaved > 0) {
                                  print(planBloc!.mountSaved);
                                  Navigator.pushNamed(
                                      context, RegisterPage.route);
                                }
                              }
                            : null,
                        child: Text('CONTINUE'),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
