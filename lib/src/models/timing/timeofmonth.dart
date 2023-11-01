import 'dart:convert';
import '../calendar_model/datum.dart';
class TimeOfMonth {
  int? code;
  String? status;
  List<Datum>? data;
  TimeOfMonth({this.code, this.status, this.data});
  TimeOfMonth.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Datum.fromJson(e)).toList();
    }
  }
  Map<String, dynamic> toMap() => {'code': code, 'status': status, 'data': jsonEncode(data)};
  factory TimeOfMonth.fromMap(Map<String, dynamic> s) =>
      TimeOfMonth(code: s['code'], status: s['status'], data: List<Datum>.from(
          json.decode(s['data']).map((x) => Datum.fromJson(x))));
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}