import 'package:beasy/models/company_model/company_category.dart';
import 'package:beasy/models/company_model/company_stream.dart';

class Company {
  final String companyId;
  final String companyOwnerId;
  final String companyDescription;

  final List<CompanyCategory> companyCategories;
  final List<CompanyStream> companyStreams;

  Company({
    this.companyId,
    this.companyCategories,
    this.companyDescription,
    this.companyOwnerId,
    this.companyStreams,
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
      companyStreams: (json["companyStreams"] as List)
          .map((e) => CompanyStream.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data["companyId"] = this.companyId;
    data["companyOwnerId"] = this.companyOwnerId;
    data["companyDescription"] = this.companyDescription;
    data["companyStreams"] = this.companyStreams != null
        ? this
            .companyStreams
            .map(
              (e) => e.toJson(),
            )
            .toList()
        : null;
    data["companyCategories"] = this.companyCategories != null
        ? this.companyCategories.map((e) => e.toJson()).toList()
        : null;

    return data;
  }
}
