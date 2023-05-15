import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/plan_user.dart';
import 'package:saver/repositories/plan_repository.dart';

mixin PlanUseCase {
  Future savePlanUser(PlanUser planUser);
  Future<PlanUser> getPlanUser(String user);
}

@Injectable(as: PlanUseCase)
class PlanUseCaseAdapter implements PlanUseCase {
  final PlanRepository _planRepository;

  PlanUseCaseAdapter(this._planRepository);

  @override
  Future savePlanUser(PlanUser planUser) {
    return _planRepository.savePlanUser(planUser);
  }

  @override
  Future<PlanUser> getPlanUser(String user) {
    return _planRepository.getPlanUser(user);
  }
}
