import 'package:hive/hive.dart';
import 'package:saver/models/storage/hive_type_id.dart';

part 'login_user.g.dart';

@HiveType(typeId: HiveTypeId.LOGIN_USER)
class LoginUser {
  @HiveField(0)
  String? user;
  @HiveField(1)
  String? mail;
  @HiveField(2)
  String? password;
  @HiveField(3)
  bool? rememberMe;

  LoginUser(this.user, this.mail, this.password, this.rememberMe);

  LoginUser.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    mail = json['mail'];
    password = json['password'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['mail'] = mail;
    data['password'] = password;
    data['rememberMe'] = rememberMe;
    return data;
  }
}
