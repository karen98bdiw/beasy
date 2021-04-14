import 'package:beasy/utils/enums.dart';

UserType userTypeFromString(String typeString) {
  switch (typeString) {
    case "Company Owner":
      return UserType.CompanyOwner;
      break;
    case "Usual User":
      return UserType.UsualUser;
      break;
  }
  return null;
}

String stringFromUserType(UserType type) {
  switch (type) {
    case UserType.CompanyOwner:
      return "Company Owner";
      break;
    case UserType.UsualUser:
      return "Usual User";
      break;
  }

  return null;
}
