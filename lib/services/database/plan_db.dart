import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/plan_user.dart';

const String PLAN_BOX = "planBox";

mixin PlanDB {
  Future savePlanUser(PlanUser planUser);
}

@Injectable(as: PlanDB)
class PlanDBAdapater implements PlanDB {
  Future<Box> _openBox(String nameBox) async {
    try {
      final box = await Hive.openBox(nameBox);
      return box;
    } catch (e) {
      log(e.toString(), name: 'PlanDB');
      rethrow;
    }
  }

  @override
  Future savePlanUser(PlanUser planUser) async {
    try {
      final box = await _openBox(PLAN_BOX);
      await box.put(planUser.user, planUser);
    } catch (e) {
      log(e.toString(), name: 'SavePlanUser');
      rethrow;
    }
  }
}
