import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/plan_user.dart';

const String PLAN_BOX = "planBox";

mixin PlanDB {
  Future savePlanUser(PlanUser planUser);
  Future<PlanUser> getPlanUser(String user);
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

  @override
  Future<PlanUser> getPlanUser(String user) async {
    try {
      final box = await _openBox(PLAN_BOX);
      PlanUser? result = await box.get(user);
      return result ?? PlanUser('', 0, 0);
    } catch (e) {
      log(e.toString(), name: 'GetPlanUser');
      rethrow;
    }
  }
}
