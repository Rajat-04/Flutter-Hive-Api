import 'package:task/models/user.dart';

class Root {
  List<User?>? users;
  Root({this.users});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }
}
