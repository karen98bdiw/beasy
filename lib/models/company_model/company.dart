import 'package:beasy/models/company_model/company_category.dart';
import 'package:beasy/models/company_model/company_stream.dart';

class Company {
  String companyId;
  String companyOwnerId;
  final String companyName;
  final String companyDescription;
  final List<String> companyImages;
  final String companyAvatar;
  final List<CompanyCategory> companyCategories;
  List<CompanyStream> companyStreams = [];

  Company({
    this.companyId,
    this.companyCategories,
    this.companyDescription,
    this.companyOwnerId,
    this.companyName,
    this.companyAvatar,
    this.companyImages,
  });

  factory Company.fromJson(json) {
    return Company(
      companyId: json["companyId"],
      companyCategories: json["companyCategories"] != null
          ? (json["companyCategories"] as List)
              .map((e) => CompanyCategory.fromJson(e))
              .toList()
          : null,
      companyDescription: json["companyDescription"],
      companyOwnerId: json["companyOwnerId"],
      companyName: json["companyName"],
      companyAvatar: json["companyAvatar"],
      companyImages: json["companyImages"] != null
          ? (json["companyImages"] as List).map((e) => e.toString()).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data["companyId"] = this.companyId;
    data["companyOwnerId"] = this.companyOwnerId;
    data["companyDescription"] = this.companyDescription;

    data["companyCategories"] = this.companyCategories != null
        ? this.companyCategories.map((e) => e.toJson()).toList()
        : null;
    data["companyName"] = this.companyName;
    data["companyImages"] = this.companyImages ?? null;
    data["companyAvatar"] = this.companyAvatar;
    return data;
  }
}
