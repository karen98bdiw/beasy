import 'package:beasy/utils/enums.dart';
import 'package:beasy/utils/helpers.dart';

class User {
  String id;
  final String name;
  final String surname;
  final String email;
  final UserType userType;
  final String companyId;

  User({
    this.id,
    this.companyId,
    this.email,
    this.name,
    this.surname,
    this.userType,
  });

  factory User.fromJson(json) {
    return User(
      name: json["name"],
      surname: json["surname"],
      email: json["email"],
      companyId: json["companyId"],
      id: json["id"],
      userType: userTypeFromString(json["userType"]),
    );
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data["name"] = this.name;
    data["surname"] = this.surname;
    data["email"] = this.email;
    data["companyId"] = this.companyId;
    data["id"] = this.id;
    data["userType"] = stringFromUserType(
      this.userType,
    );
    return data;
  }
}
