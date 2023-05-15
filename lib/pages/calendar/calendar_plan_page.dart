import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/constants.dart';
import 'package:saver/dependency_injections/injection.dart';

class CalendarPlanPage extends StatefulWidget {
  const CalendarPlanPage({Key? key}) : super(key: key);

  @override
  State<CalendarPlanPage> createState() => _CalendarPlanPageState();
}

class _CalendarPlanPageState extends State<CalendarPlanPage> {
  final PlanBloc? planBloc = Provider.of<PlanBloc>(() => getIt.get<PlanBloc>());

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    await planBloc!.getPlanUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar Plan',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: StreamBuilder<int>(
        stream: planBloc!.getDayToSave,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data! > 0) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 2, right: 8),
                child: GridView.builder(
                  itemCount: snapshot.data,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: CardCalendarPlan(
                        index: index,
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data! == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Create a Plan')),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CardCalendarPlan extends StatelessWidget {
  final int index;
  const CardCalendarPlan({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.grey.shade400)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/Airpod.svg",
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day ${index + 1}',
                  style: const TextStyle(color: primaryColor),
                ),
                const Text(
                  '\$99',
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
