import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/plan_user.dart';
import 'package:saver/services/database/plan_db.dart';

mixin PlanRepository {
  Future savePlanUser(PlanUser planUser);
}

@Injectable(as: PlanRepository)
class PlanUserRepositoryAdapter implements PlanRepository {
  final PlanDB planDB;

  PlanUserRepositoryAdapter(this.planDB);

  @override
  Future savePlanUser(PlanUser planUser) {
    return planDB.savePlanUser(planUser);
  }
}
