import 'package:hive/hive.dart';
import 'package:saver/models/storage/hive_type_id.dart';

part 'plan_user.g.dart';

@HiveType(typeId: HiveTypeId.PLAN_USER)
class PlanUser {
  @HiveField(0)
  String? user;
  @HiveField(1)
  int? dayToSave;
  @HiveField(2)
  int? mountSaved;

  PlanUser(
    this.user,
    this.dayToSave,
    this.mountSaved,
  );

  PlanUser.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    dayToSave = json['dayToSave'];
    mountSaved = json['mountSaved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['dayToSave'] = dayToSave;
    data['mountSaved'] = mountSaved;
    return data;
  }
}
