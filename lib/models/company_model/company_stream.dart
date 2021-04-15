import 'package:beasy/models/company_model/company_stream_service.dart';
import 'package:beasy/models/company_model/stream_queue_item.dart';

class CompanyStream {
  final String companyStreamId;
  final String streamName;
  final String streamDescription;
  final List<String> streamImages;
  final List<StreamQueueItem> queue;
  List<CompanyStreamService> streamServices;

  CompanyStream(
      {this.companyStreamId,
      this.queue,
      this.streamImages,
      this.streamName,
      this.streamServices,
      this.streamDescription});

  factory CompanyStream.fromJson(json) {
    return CompanyStream(
      companyStreamId: json["companyStreamId"],
      streamName: json["streamName"],
      streamDescription: json["stremaDescription"],
      streamImages:
          json["streamImages"] != null ? (json["streamImages"] as List) : null,
      queue: json["queue"] != null
          ? (json["queue"] as List)
              .map((e) => StreamQueueItem.fromJson(e))
              .toList()
          : null,
      streamServices: json["streamServices"] != null
          ? (json["streamServices"] as List)
              .map((element) => CompanyStreamService.fromJson(element))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data["companyStreamId"] = this.companyStreamId;
    data["queue"] =
        this.queue != null ? this.queue.map((e) => e.toJson()).toList() : null;
    data["streamName"] = this.streamName;
    data["streamDescription"] = this.streamDescription;
    data["streamImages"] = this.streamImages;
    data["streamServices"] = this.streamServices != null
        ? this.streamServices.map((e) => e.toJson()).toList()
        : null;
    return data;
  }
}
